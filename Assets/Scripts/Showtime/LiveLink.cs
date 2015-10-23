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

    public GameObject buttonPrefab;
    public GameObject sliderPrefab;
    public GameObject devicePanelPrefab;
    public GameObject trackPanelPrefab;
    public GameObject songPrefab;

    public Transform uiCenter;

    private Dictionary<string, LiveProxy> m_liveProxies;
    private Queue<LiveProxy> m_freshProxies;
    private ConcurrentQueue<Func<LiveProxy>> m_queuedProxyCreations;
    private ConcurrentQueue<Action> m_queuedProxyRemovals;


    // Use this for initialization
    void Start () {
        m_liveProxies = new Dictionary<string, LiveProxy>();
        m_freshProxies = new Queue<LiveProxy>();
        m_queuedProxyCreations = new ConcurrentQueue<Func<LiveProxy>>();
        m_queuedProxyRemovals = new ConcurrentQueue<Action>();

        if (node != null)
        {
            StartCoroutine("RegisterNode");
        }
    }

    IEnumerator RegisterNode()
    {
        while (!connected) yield return null;

        node.subscribeToNode(peer);
        node.connectToPeer(peer);
        node.subscribeToMethod(peer.methods["layout_updated"], layoutUpdated);

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
                        float min = float.Parse(liveObjParams["min"].ToString());
                        float max = float.Parse(liveObjParams["max"].ToString());
                        Debug.Log("Enqueing parameter: " + id);
                        string p_id = id;
                        string p_name = name;
                        string p_parentId = parentId;
                        float p_min = min;
                        float p_max = max;
                        m_queuedProxyCreations.Enqueue(() => createLiveSliderUI(p_id, p_name, p_parentId, p_min, p_max));
                        break;
                    case "PyroDevice":
                        Debug.Log("Enqueing Device: " + id);
                        string d_id = id;
                        string d_name = name;
                        string d_parentId = parentId;
                        m_queuedProxyCreations.Enqueue(() => createLiveDeviceUI(d_id, d_name, d_parentId));

                        break;
                    case "PyroTrack":
                        Debug.Log("Enqueing Track: " + id);
                        string t_id = id;
                        string t_name = name;
                        string t_parentId = parentId;
                        m_queuedProxyCreations.Enqueue(() => createLiveTrackUI(t_id, t_name, t_parentId));
                        break;
                    case "PyroSong":
                        Debug.Log("Enqueing Track: " + id);
                        string sng_id = id;
                        string sng_name = name;
                        string sng_parentId = parentId;
                        m_queuedProxyCreations.Enqueue(() => createLiveSongUI(sng_id, sng_name, sng_parentId));
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
        //Need to catch threaded JSON deserialization errors
        List<string> errors = new List<string>();
        JsonSerializerSettings settings = new JsonSerializerSettings
        {
            Error = delegate (object sender, ErrorEventArgs args) {
                errors.Add(args.ErrorContext.Error.Message);
                args.ErrorContext.Handled = true;
            }
        };

        //Deserialize JSON
        Dictionary<string, object> layoutMessage = JsonConvert.DeserializeObject<Dictionary<string, object>>(json, settings);
        object[] layoutObjects = JsonConvert.DeserializeObject<object[]>(layoutMessage["value"].ToString(), settings);
        foreach (string e in errors) Debug.Log(e);

        //Deserialize child updates
        List<Dictionary<string, object>> layout = new List<Dictionary<string, object>>();
        foreach (object liveObj in layoutObjects)
        {
            layout.Add(JsonConvert.DeserializeObject<Dictionary<string, object>>(liveObj.ToString()));
        }

        return layout;
    }

    private LiveSongProxy createLiveSongUI(string id, string name, string parent)
    {
        Debug.Log("Building song: " + id.ToString());
        GameObject songObj = GameObject.Instantiate(songPrefab);
        LiveSongProxy songProxy = songObj.AddComponent<LiveSongProxy>();
        songProxy.transform.SetParent(uiCenter);
        songProxy.init(id, name, parent);
        return songProxy;
    }

    private LiveTrackProxy createLiveTrackUI(string id, string name, string parent)
    {
        Debug.Log("Building track: " + id.ToString());
        GameObject trackObj = GameObject.Instantiate(trackPanelPrefab);
        LiveTrackProxy trackProxy = trackObj.AddComponent<LiveTrackProxy>();
        trackProxy.transform.SetParent(uiCenter);
        trackProxy.init(id, name, parent);
        return trackProxy;
    }

    private LiveDeviceProxy createLiveDeviceUI(string id, string name, string parent)
    {
        Debug.Log("Building device: " + id.ToString());
        GameObject deviceObj = GameObject.Instantiate(devicePanelPrefab);
        LiveDeviceProxy deviceProxy = deviceObj.AddComponent<LiveDeviceProxy>();
        deviceProxy.init(id, name, parent);
        return deviceProxy;
    }

    private LiveParameterProxy createLiveSliderUI(string id, string name, string parent, float min, float max)
    {
        Debug.Log("Building parameters: " + id.ToString());
        GameObject sliderObj = GameObject.Instantiate(sliderPrefab);
        SliderDemo slider = sliderObj.GetComponentInChildren<SliderDemo>();
        LiveParameterProxy parameterProxy = sliderObj.AddComponent<LiveParameterProxy>();
        parameterProxy.init(id, name, parent, min, max);

        SliderToLiveDataBinder dataBinder = sliderObj.AddComponent<SliderToLiveDataBinder>();
        dataBinder.init(this, parameterProxy, slider);
        return parameterProxy;
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
}
