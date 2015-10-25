using UnityEngine;
using Utils;
using UnityEngine.UI;
using System.Collections;

public class LiveTrackProxy : LiveProxy {

    private Transform deviceParent;
    private Transform clipParent;
    private Text label;

    void Awake() {
        label = gameObject.FindInChildren("track_label").GetComponent<Text>();
        deviceParent = gameObject.FindInChildren("devices").transform;
        clipParent = gameObject.FindInChildren("clips").transform;
    }

    public override void init(string id, string name, string parent)
    {
        label.text = name;
        base.init(id, name, parent);
    }

    public override bool AddChild(LiveProxy proxy)
    {
        if(proxy.GetType() == typeof(LiveDeviceProxy))
            proxy.transform.SetParent(deviceParent);
        else if (proxy.GetType() == typeof(LiveClipProxy))
            proxy.transform.SetParent(clipParent);
        return base.AddChild(proxy);
    }
}
