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
        if (proxy != null && !waitingForExternalData) proxy.update_value(sliderVal.Map(0.0f, 1.0f, proxy.min, proxy.max));
        if (waitingForExternalData) m_locked = false;
    }

    override public float GetCurrentData()
    {
        return sliderVal;
    }

    private bool m_locked;
    public void awaitExternalData(){ m_locked = true; }
    public bool waitingForExternalData { get { return m_locked; } }
}
