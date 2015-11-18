using UnityEngine;
using UnityEngine.UI;
using Utils;
using System.Collections;
using System.Collections.Generic;
using System;

[RequireComponent(typeof(SliderToLiveDataBinder))]
public class LiveParameterProxy : LiveProxy
{
    [NonSerialized]
    private Text m_label;
    private SliderDemo m_slider;

    [NonSerialized]
    private SliderToLiveDataBinder m_dataBinder;
    public SliderToLiveDataBinder databinder { get { return m_dataBinder; } }

    private float m_min;
    public float min{ set { m_min = value; } get { return m_min; } }

    private float m_max;
    public float max { set { m_max = value; } get { return m_max; } }

    public void Awake()
    {
        isCloneable = true;
        //m_label = transform.Find("slider").Find("label").GetComponent<Text>();
        m_label = transform.Find("label").GetComponent<Text>();
    }

    public void init(LiveLink live, string liveId, string name, string liveParent, float minimum, float maximum, float startValue)
    {
        m_slider = gameObject.GetComponentInChildren<SliderDemo>();
        m_dataBinder = gameObject.GetComponent<SliderToLiveDataBinder>();
        m_dataBinder.init(this, m_slider, startValue.Map(minimum, maximum, 0.0f, 1.0f));

        min = minimum;
        max = maximum;

        if (m_label != null) m_label.text = name;
        base.init(live, liveId, name, liveParent);
    }

    public override void receive_value(object value)
    {
        m_dataBinder.awaitExternalData();
        m_dataBinder.SetCurrentData(MathTools.Remap((float)value, min, max, 0.0f, 1.0f));
    }

    public override void update_value(object value)
    {
        Dictionary<string, object> args = new Dictionary<string, object>();
        args.Add("id", id);
        args.Add("value", value);
        live.node.updateRemoteMethod(live.peer.methods["param_set"], args);
    }

    public override LiveProxy clone(bool cloneIsCopyable = false)
    {
        if (isCloneable)
        {
            LiveParameterProxy proxy = (LiveParameterProxy)LiveParameterProxyController.instance.copyProxy(this);
            proxy.isCloneable = cloneIsCopyable;
            return (LiveProxy)proxy;
        }
        return base.clone(cloneIsCopyable);
    }
}
