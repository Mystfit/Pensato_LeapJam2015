using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using ZST;
using Newtonsoft.Json;

public class LiveLink : UnityNode {

    public GameObject buttonPrefab;
    public GameObject sliderPrefab;

	// Use this for initialization
	void Start () {
        if (node != null)
        {
            AsyncIO.ForceDotNet.Force();
            node.subscribeToNode(peer);
            node.connectToPeer(peer);
            node.subscribeToMethod(peer.methods["layout_updated"], layoutUpdated);

            string layoutJson = node.updateRemoteMethod(peer.methods["song_layout"]).output.ToString();
            createLiveProxies(layoutJson);
        }
    }

    private void createLiveProxies(String jsonLayout)
    {
        Dictionary<string, object> layout = JsonConvert.DeserializeObject<Dictionary<string, object>>(jsonLayout);
        object[] liveObjects = JsonConvert.DeserializeObject<object[]>(layout["val"].ToString());

        foreach (object liveObj in liveObjects)
        {
            Dictionary<string, object> liveObjParams = JsonConvert.DeserializeObject<Dictionary<string, object>>(liveObj.ToString());
            
            GameObject sliderObj = GameObject.Instantiate(sliderPrefab);
            SliderDemo slider = sliderObj.GetComponentInChildren<SliderDemo>();
            SliderToLiveDataBinder dataBinder = sliderObj.AddComponent<SliderToLiveDataBinder>();
            dataBinder.init(this, liveObjParams["id"].ToString(), slider);
        }
    }


    public object layoutUpdated(ZstMethod data)
    {
        Debug.Log(data.output);
        return null;
    }
}
