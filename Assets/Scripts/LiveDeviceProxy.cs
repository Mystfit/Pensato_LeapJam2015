using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class LiveDeviceProxy : LiveProxy
{

    //ASSUME: Have content/parameters
    //ASSUME: Have contents/Panel/device_label
    private Transform parameterParent;
    private Text label;

    void Awake()
    {
        Transform contents = transform.Find("contents");

        label = contents.Find("title_panel").GetChild(0).gameObject.GetComponent<Text>();
        parameterParent = contents.Find("parameters");
    }

    public override void init(string id, string name, string parent)
    {
        label.text = proxyName;
        base.init(id, name, parent);
    }

    public override bool AddChild(LiveProxy proxy)
    {
        proxy.transform.SetParent(parameterParent, false);
        return base.AddChild(proxy);
    }
}
