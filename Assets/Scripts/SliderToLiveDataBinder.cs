using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using LMWidgets;
using Utils;

public class SliderToLiveDataBinder : DataBinderSlider
{
    public LiveLink live;
    public string proxyId;
    public string parent;
    protected float sliderVal;
    private Text label;
    private LiveParameterProxy proxy;

    public void init(LiveLink nodeLink, LiveParameterProxy parameter, SliderBase slider)
    {
        label = GetComponentInChildren<Text>();
        label.text = parameter.proxyName;
        live = nodeLink;
        proxy = parameter;
        AddWidget(slider);
    }

    override protected void setDataModel(float value)
    {
        sliderVal = value;
        if (live != null)
        {
            if (live.connected)
            {
                Dictionary<string, object> args = new Dictionary<string, object>();
                args.Add("id", proxy.id);
                args.Add("value", sliderVal.Map(0.0f, 1.0f, proxy.min, proxy.max));
                live.node.updateRemoteMethod(live.peer.methods["param_set"], args);
            }
        }
    }

    override public float GetCurrentData()
    {
        return sliderVal;
    }
}
