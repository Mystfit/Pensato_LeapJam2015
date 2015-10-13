using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using LMWidgets;

public class SliderToLiveDataBinder : DataBinderSlider
{
    public LiveLink live;
    public string proxyId;
    protected float sliderVal;

    public void init(LiveLink nodeLink, string id, SliderBase slider)
    {
        proxyId = id;
        live = nodeLink;
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
                args.Add("id", proxyId);
                args.Add("value", sliderVal);
                live.node.updateRemoteMethod(live.peer.methods["param_set"], args);
            }
        }
    }

    override public float GetCurrentData()
    {
        return sliderVal;
    }
}
