using UnityEngine;
using Utils;
using System.Collections;

public class LiveTrackProxy : LiveProxy {

    private Transform deviceParent;

    void Awake() {
        deviceParent = gameObject.FindInChildren("devices").transform;
    }

    public override bool AddChild(LiveProxy proxy)
    {
        proxy.transform.SetParent(deviceParent, false);
        return base.AddChild(proxy);
    }
}
