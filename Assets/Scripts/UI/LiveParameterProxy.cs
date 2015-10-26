using UnityEngine;
using UnityEngine.UI;
using Utils;
using System.Collections;
using System.Collections.Generic;

public class LiveParameterProxy : LiveProxy
{
    private Text m_label;
    protected SliderToLiveDataBinder m_dataBinder;
    public SliderToLiveDataBinder databinder { get { return m_dataBinder; } }

    private float m_min;
    public float min
    {
        set { m_min = value; }
        get { return m_min; }
    }

    private float m_max;
    public float max
    {
        set { m_max = value; }
        get { return m_max; }
    }

    public void Awake()
    {
        m_label = gameObject.FindInChildren("label").GetComponent<Text>();
    }

    public void init(LiveLink live, string liveId, string name, string liveParent, float minimum, float maximum, float startValue)
    {
        SliderDemo slider = gameObject.GetComponentInChildren<SliderDemo>();
        m_dataBinder = gameObject.AddComponent<SliderToLiveDataBinder>();
        m_dataBinder.init(this, slider, startValue.Map(minimum, maximum, 0.0f, 1.0f));

        min = minimum;
        max = maximum;

        if (m_label != null) m_label.text = name;
        base.init(live, liveId, name, liveParent);
    }

    public override void receive_value(object value)
    {
        m_dataBinder.SetCurrentData((float)value);
    }

    public override void update_value(object value)
    {
        Dictionary<string, object> args = new Dictionary<string, object>();
        args.Add("id", id);
        args.Add("value", value);
        live.node.updateRemoteMethod(live.peer.methods["param_set"], args);
    }
}
