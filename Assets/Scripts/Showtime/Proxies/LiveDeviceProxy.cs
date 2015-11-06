using UnityEngine;
using UnityEngine.UI;
using Utils;
using System.Collections;
using System;

public class LiveDeviceProxy : LiveProxy
{
    //ASSUME: Have content/parameters
    //ASSUME: Have contents/Panel/device_label
    private Transform parameterParent;
    private Text label;

    void Awake()
    {
        isCloneable = false;
        parameterParent = gameObject.FindInChildren("content").transform;
        label = gameObject.FindInChildren("device_label").GetComponent<Text>();
    }

    public override void init(LiveLink live, string id, string name, string parent)
    {
        label.text = name;
        base.init(live, id, name, parent);
    }

    public override bool AddChild(LiveProxy proxy)
    {
        proxy.transform.SetParent(parameterParent);
        return base.AddChild(proxy);
    }

    public override void update_value(object value){}
    public override void receive_value(object value){}

    
}
