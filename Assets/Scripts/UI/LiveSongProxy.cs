using UnityEngine;
using Utils;
using System.Collections;
using System;

public class LiveSongProxy : LiveProxy {

    //ASSUME: Have track holder
    private Transform trackParent;

    void Awake () {
        trackParent = gameObject.FindInChildren("tracks").transform;
    }

    public override bool AddChild(LiveProxy proxy)
    {
        proxy.transform.SetParent(trackParent, false);
        return base.AddChild(proxy);
    }

    public override void update_value(object value){}
    public override void receive_value(object value){}
}
