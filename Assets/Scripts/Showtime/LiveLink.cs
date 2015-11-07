using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using ThreadingCollections;
using System;
using ZST;
using NetMQ;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

public class LiveLink : UnityNode {

    protected LiveSongProxyController m_songController;
    protected LiveTrackProxyController m_trackController;
    protected LiveDeviceProxyController m_deviceController;
    protected LiveParameterProxyController m_parameterController;
    protected LiveClipProxyController m_clipController;

    private Dictionary<string, LiveProxy> m_liveProxies;
    private Queue<LiveProxy> m_freshProxies;
    private ConcurrentQueue<Func<LiveProxy>> m_queuedProxyCreations;
    private ConcurrentQueue<Action> m_queuedProxyRemovals;


    // Use this for initialization
    void Start () {
        //Proxy queues
        m_liveProxies = new Dictionary<string, LiveProxy>();
        m_freshProxies = new Queue<LiveProxy>();
        m_queuedProxyCreations = new ConcurrentQueue<Func<LiveProxy>>();
        m_queuedProxyRemovals = new ConcurrentQueue<Action>();

        //Proxy controllers
        m_songController = GetComponent<LiveSongProxyController>();
        m_trackController = GetComponent<LiveTrackProxyController>();
        m_deviceController = GetComponent<LiveDeviceProxyController>();
        m_parameterController = GetComponent<LiveParameterProxyController>();
        m_clipController = GetComponent<LiveClipProxyController>();

        if (node != null) StartCoroutine("RegisterNode");
    }

    IEnumerator RegisterNode()
    {
        while (!connected) yield return null;

        node.subscribeToNode(peer);
        node.connectToPeer(peer);
        node.subscribeToMethod(peer.methods["layout_updated"], layoutUpdated);

        m_songController.registerShowtimeListeners();
        m_trackController.registerShowtimeListeners();
        m_deviceController.registerShowtimeListeners();
        m_parameterController.registerShowtimeListeners();
        m_clipController.registerShowtimeListeners();

        try
        {
            string layoutJson = node.updateRemoteMethod(peer.methods["song_layout"]).output.ToString();
            createLiveProxies(deserializeLayout(layoutJson));
        }
        catch (NetMQ.NetMQException e)
        {
            Debug.Log("Live did not respond. Check your connection. " + e.ToString());
        }
    }

    public object layoutUpdated(ZstMethod methodData)
    {
        Debug.Log("Received layout update from Live");
        createLiveProxies(deserializeLayout(methodData.output.ToString()));
        return null;
    }

    private void createLiveProxies(List<Dictionary<string, object>> layout)
    {
        foreach (Dictionary<string, object> liveObjParams in layout)
        {
            string id = liveObjParams["id"].ToString();
            string status = (liveObjParams.ContainsKey("status")) ? liveObjParams["status"].ToString() : "added";

            if (status == "added")
            {
                string name = null;
                string parentId = null;
                if (liveObjParams["name"] != null) name = liveObjParams["name"].ToString();
                if (liveObjParams["parent"] != null) parentId = liveObjParams["parent"].ToString();
    
                switch (liveObjParams["type"].ToString()){
                    case "PyroDeviceParameter":
                        Debug.Log("Enqueing parameter: " + id);
                        float min = float.Parse(liveObjParams["min"].ToString());
                        float max = float.Parse(liveObjParams["max"].ToString());
                        string p_id = id;
                        string p_name = name;
                        string p_parentId = parentId;
                        float p_min = min;
                        float p_max = max;
                        float p_startval = float.Parse(liveObjParams["min"].ToString());
                        m_queuedProxyCreations.Enqueue(() => m_parameterController.createParameter(this, p_id, p_name, p_parentId, p_min, p_max, p_startval));
                        break;
                    case "PyroDevice":
                        Debug.Log("Enqueing Device: " + id);
                        string d_id = id;
                        string d_name = name;
                        string d_parentId = parentId;
                        m_queuedProxyCreations.Enqueue(() => m_deviceController.createDevice(this, d_id, d_name, d_parentId));
                        break;
                    case "PyroClip":
                        Debug.Log("Enqueing Clip: " + id);
                        string cl_id = id;
                        string cl_name = name;
                        string cl_parentId = parentId;
                        m_queuedProxyCreations.Enqueue(() => m_clipController.createClip(this, cl_id, cl_name, cl_parentId));
                        break;
                    case "PyroTrack":
                        Debug.Log("Enqueing Track: " + id);
                        string t_id = id;
                        string t_name = name;
                        string t_parentId = parentId;
                        m_queuedProxyCreations.Enqueue(() => m_trackController.createTrack(this, t_id, t_name, t_parentId));
                        break;
                    case "PyroSong":
                        Debug.Log("Enqueing Song: " + id);
                        string sng_id = id;
                        string sng_name = name;
                        string sng_parentId = parentId;
                        m_queuedProxyCreations.Enqueue(() => m_songController.createSong(this, sng_id, sng_name, sng_parentId));
                        break;
                }
            } else if(status == "removed")
            {
                if (m_liveProxies.ContainsKey(id))
                {
                    Debug.Log("Removing proxy: " + id);
                    string proxy_id = id;
                    m_queuedProxyRemovals.Enqueue(() => m_liveProxies[proxy_id].Destroy());
                    break;
                }
                    
            }
        }
    }

    private List<Dictionary<string, object>> deserializeLayout(string json)
    {
        List < Dictionary < string, object>> layout = new List<Dictionary<string, object>>();
        LiveMessage msg = LiveLink.parseLiveMessage(json, LiveMessageType.ARRAY);
        foreach (object liveObj in msg.array)
            layout.Add(JsonConvert.DeserializeObject<Dictionary<string, object>>(liveObj.ToString()));

        return layout;
    }


    private void createQueuedProxies()
    {
        //Create all queued proxies
        while (m_queuedProxyCreations.Count > 0)
        {
            LiveProxy freshProxy = m_queuedProxyCreations.Dequeue().Invoke();
            m_freshProxies.Enqueue(freshProxy);
            m_liveProxies[freshProxy.id] = freshProxy;
        }

        List<LiveProxy> orphanProxies = null;
        if (m_freshProxies.Count > 0)
        {
            orphanProxies = new List<LiveProxy>();
        }

        //Add all new proxies to destination parents
        while (m_freshProxies.Count > 0)
        {
            LiveProxy freshProxy = m_freshProxies.Dequeue();

            if (freshProxy.parentId != null)
            {
                if (m_liveProxies.ContainsKey(freshProxy.parentId))
                {
                    LiveProxy parent = m_liveProxies[freshProxy.parentId];
                    parent.AddChild(freshProxy);
                }
                else if (freshProxy.parentId != null)
                {
                    orphanProxies.Add(freshProxy);
                }
            }
        }

        if (orphanProxies != null)
        {
            //Proxies with no parent yet, queue for another check next update
            foreach (LiveProxy orphanProxy in orphanProxies)
            {
                m_freshProxies.Enqueue(orphanProxy);
            }
        }
    }

    private void removeQueuedProxies()
    {
        while(m_queuedProxyRemovals.Count > 0)
        {
            m_queuedProxyRemovals.Dequeue().Invoke();
        }
    }

    public void Update()
    {
        createQueuedProxies();
        removeQueuedProxies();
    }

    public enum LiveMessageType { ARRAY=0, OBJECT, VALUE };
    public static LiveMessage parseLiveMessage(string json, LiveMessageType messageType)
    {
        //Need to catch threaded JSON deserialization errors
        List<string> errors = new List<string>();
        JsonSerializerSettings settings = new JsonSerializerSettings
        {
            Error = delegate (object sender, ErrorEventArgs args) {
                errors.Add(args.ErrorContext.Error.Message);
                args.ErrorContext.Handled = true;
            }
        };

        Dictionary<string, object> msg = JsonConvert.DeserializeObject<Dictionary<string, object>>(json, settings);
        string id = msg["id"].ToString();
        string values = msg["value"].ToString();

        switch (messageType)
        {
            case LiveMessageType.ARRAY:
                object[] liveArray = JsonConvert.DeserializeObject<object[]>(values, settings);
                return new LiveMessage(id, liveArray);
            case LiveMessageType.OBJECT:
                Dictionary<string, object> liveObj = JsonConvert.DeserializeObject<Dictionary<string, object>>(values, settings);
                return new LiveMessage(id, liveObj);
            case LiveMessageType.VALUE:
                return new LiveMessage(id, float.Parse(msg["value"].ToString()));
        }
      
        foreach (string e in errors) Debug.Log(e);
        return new LiveMessage(id, null);
    }
}

public struct LiveMessage
{
    public string id;
    public object payload;

    public LiveMessage(string liveId, object livePayload){
        id = liveId;
        payload = livePayload;
    }

    public Dictionary<string, object> dict { get { return (Dictionary<string, object>)payload; } }
    public object[] array{ get { return (object[])payload; } }
}