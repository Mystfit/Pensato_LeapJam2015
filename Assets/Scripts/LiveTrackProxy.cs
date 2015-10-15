using UnityEngine;
using System.Collections;

public class LiveTrackProxy : LiveProxy {

    private Transform deviceParent;

    void Start () {
        Transform contents = transform.GetChild(0);
        deviceParent = contents.Find("devices");
    }

    public override bool AddChild(LiveProxy proxy)
    {
        proxy.transform.SetParent(deviceParent, false);
        return base.AddChild(proxy);
    }
}
