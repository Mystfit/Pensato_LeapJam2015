using UnityEngine;
using UnityEngine.UI;
using Utils;
using System.Collections;

public class LiveDeviceProxy : LiveProxy
{

    //ASSUME: Have content/parameters
    //ASSUME: Have contents/Panel/device_label
    private Transform parameterParent;
    private Text label;

    void Awake()
    {
        parameterParent = gameObject.FindInChildren("parameters").transform;
        label = gameObject.FindInChildren("device_label").GetComponent<Text>();
    }

    public override void init(string id, string name, string parent)
    {
        label.text = name;
        base.init(id, name, parent);
    }

    public override bool AddChild(LiveProxy proxy)
    {
        proxy.transform.SetParent(parameterParent, false);
        return base.AddChild(proxy);
    }
}
