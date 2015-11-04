using UnityEngine;
using UnityEngine.UI;
using System;
using System.Collections;
using System.Collections.Generic;

public class LiveClipProxy : LiveProxy
{
    protected ClipToLiveDatabinder m_dataBinder;
    protected MomentaryButton m_button;
    private Text[] m_labels;
    public ClipToLiveDatabinder databinder { get { return m_dataBinder; } }

    void Awake()
    {
        isCloneable = true;
        m_labels = GetComponentsInChildren<Text>();
    }

    public override void init(LiveLink live, string liveId, string name, string liveParent)
    {
        m_button = gameObject.GetComponentInChildren<MomentaryButton>();
        m_dataBinder = gameObject.AddComponent<ClipToLiveDatabinder>();
        m_dataBinder.init(this, m_button);
        setText(name);
        base.init(live, liveId, name, liveParent);
    }

    public void setText(string text){
        for (int i = 0; i < m_labels.Length; i++) m_labels[i].text = text;
    }

    protected bool m_isTriggered;
    public bool isTriggered {
        get { return m_isTriggered; }
        set {
            m_button.onGraphics.SetColor(Color.yellow);  //Need a clip button graphic type!
            m_isTriggered = value;
        }
    }

    protected bool m_isPlaying;
    public bool isPlaying
    {
        get { return m_isPlaying; }
        set
        {
            if (value)
            {
                ((LiveTrackProxy)parent).playingClip(this);
                databinder.SetCurrentData(true);
                m_button.onGraphics.SetColor(m_button.MidGraphicsOnColor);  //Need a clip button graphic type!
            }
            else
            {
                databinder.SetCurrentData(false);
                m_isPlaying = value;
            }
        }
    }

    public override void receive_value(object value)
    {
        m_dataBinder.SetCurrentData((bool)value);
    }

    public override void update_value(object value)
    {
        Dictionary<string, object> args = new Dictionary<string, object>();
        args.Add("id", id);
        live.node.updateRemoteMethod(live.peer.methods["clip_trigger"], args);
    }

    public override LiveProxy clone(bool cloneIsCopyable = false)
    {
        if (isCloneable)
        {
            LiveClipProxy proxy = (LiveClipProxy)LiveClipProxyController.instance.copyProxy(this);
            proxy.isCloneable = cloneIsCopyable;
            return (LiveProxy)proxy;
        }
        return base.clone(cloneIsCopyable);
    }

    public override void minimize() { }
    public override void maximize(){}
}
