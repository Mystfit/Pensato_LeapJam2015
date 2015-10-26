using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using LMWidgets;
using Utils;

public class SliderToLiveDataBinder : DataBinderSlider
{
    protected float sliderVal;
    private LiveParameterProxy proxy;

    public void init(LiveParameterProxy parameter, SliderBase slider, float startValue)
    {
        sliderVal = startValue;
        proxy = parameter;
        AddWidget(slider);
    }

    override protected void setDataModel(float value)
    {
        sliderVal = value;
        if (proxy != null) proxy.update_value(sliderVal.Map(0.0f, 1.0f, proxy.min, proxy.max));
    }

    override public float GetCurrentData()
    {
        return sliderVal;
    }
}
