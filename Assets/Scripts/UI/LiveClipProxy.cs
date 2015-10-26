using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

public class LiveClipProxy : LiveProxy
{
    protected ClipToLiveDatabinder m_dataBinder;
    protected MomentaryButton m_button;
    public ClipToLiveDatabinder databinder { get { return m_dataBinder; } }

    public override void init(LiveLink live, string liveId, string name, string liveParent)
    {
        m_button = gameObject.GetComponentInChildren<MomentaryButton>();
        m_dataBinder = gameObject.AddComponent<ClipToLiveDatabinder>();
        m_dataBinder.init(this, m_button);
        base.init(live, liveId, name, liveParent);
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
}
