using UnityEngine;
using Utils;
using UnityEngine.UI;
using System.Collections;
using System;

public class LiveTrackProxy : LiveProxy {

    public Transform deviceParent;
    public Transform clipParent;
    private Text label;
    private LiveClipProxy m_playingClip;
    private UnityEngine.Color m_color;

    public PatchCable amplitudeJack;

    void Awake() {
        isCloneable = false;
        label = gameObject.FindInChildren("track_label").GetComponent<Text>();
        deviceParent = gameObject.FindInChildren("devices").transform;
        clipParent = gameObject.FindInChildren("clips").transform;
    }

    public void init(LiveLink live, string id, string name, string parent, UnityEngine.Color color)
    {
        label.text = name;
        m_color = color;
        amplitudeJack = new PatchCable(PatchCable.PlugType.JACK);
        base.init(live, id, name, parent);
    }

    public override void Destroy()
    {
        foreach(PatchCable plug in amplitudeJack.connections)
            plug.Disconnect(amplitudeJack);
        base.Destroy();
    }

    public override bool AddChild(LiveProxy proxy)
    {
        if(proxy.GetType() == typeof(LiveDeviceProxy))
            proxy.transform.SetParent(deviceParent);
        else if (proxy.GetType() == typeof(LiveClipProxy))
            proxy.transform.SetParent(clipParent);
        return base.AddChild(proxy);
    }

    public void playingClip(LiveClipProxy clip)
    {
        if(m_playingClip != null) m_playingClip.isPlaying = false;
        m_playingClip = clip;
    }

    public override void update_value(object value){}
    public override void receive_value(object value){}
}