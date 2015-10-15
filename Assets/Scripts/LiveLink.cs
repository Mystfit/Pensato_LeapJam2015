using UnityEngine;
using System.Collections;
using System.Collections.Generic;
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
    public Transform uiCenter;

    private Dictionary<string, LiveProxy> m_liveProxies;
    private Queue<LiveProxy> m_freshProxies;
    private Queue<Func<LiveProxy>> m_queuedProxyCreations;


    // Use this for initialization
    void Start () {
        m_liveProxies = new Dictionary<string, LiveProxy>();
        m_freshProxies = new Queue<LiveProxy>();
        m_queuedProxyCreations = new Queue<Func<LiveProxy>>();

        if (node != null)
        {
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
                Debug.Log("Live did not respond. Check your connection.");
            }
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
                        m_queuedProxyCreations.Enqueue(() => createLiveSliderUI(id, name, parentId, min, max));
                        break;
                    case "PyroDevice":
                        m_queuedProxyCreations.Enqueue(() => createLiveDeviceUI(id, name, parentId));
                        break;
                    case "PyroTrack":
                        m_queuedProxyCreations.Enqueue(() => createLiveTrackUI(id, name, parentId));
                        break;
                }
            } else if(status == "removed")
            {
                if(m_liveProxies.ContainsKey(id)) m_liveProxies[id].Destroy();
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

    private LiveTrackProxy createLiveTrackUI(string id, string name, string parent)
    {
        GameObject trackObj = GameObject.Instantiate(trackPanelPrefab);
        LiveTrackProxy trackProxy = trackObj.AddComponent<LiveTrackProxy>();
        trackProxy.transform.SetParent(uiCenter);
        trackProxy.init(id, name, parent);
        m_liveProxies[id] = trackProxy;
        return trackProxy;
    }

    private LiveDeviceProxy createLiveDeviceUI(string id, string name, string parent)
    {
        GameObject deviceObj = GameObject.Instantiate(devicePanelPrefab);
        LiveDeviceProxy deviceProxy = deviceObj.AddComponent<LiveDeviceProxy>();
        deviceProxy.init(id, name, parent);
        m_liveProxies[id] = deviceProxy;
        return deviceProxy;

    }

    private LiveParameterProxy createLiveSliderUI(string id, string name, string parent, float min, float max)
    {
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
            m_freshProxies.Enqueue(m_queuedProxyCreations.Dequeue().Invoke());
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
            if (m_liveProxies.ContainsKey(freshProxy.parentId) && freshProxy.parentId != null)
            {
                LiveProxy parent = m_liveProxies[freshProxy.parentId];
                parent.AddChild(freshProxy);
            }
            else
            {
                orphanProxies.Add(freshProxy);
            }
        }

        //Proxies with no parent yet, queue for another check next update
        foreach (LiveProxy orphanProxy in orphanProxies)
        {
            m_freshProxies.Enqueue(orphanProxy);
        }
    }

    public void Update()
    {
        createQueuedProxies();
    }
}
