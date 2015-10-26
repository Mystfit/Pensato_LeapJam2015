using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using LMWidgets;
using Utils;
using System;

public class ClipToLiveDatabinder : DataBinderMomentary
{
    protected bool buttonState;
    private LiveClipProxy proxy;

    public void init(LiveClipProxy clip, MomentaryButtonBase button)
    {
        proxy = clip;
        AddWidget(button);
    }

    public override bool GetCurrentData()
    {
        return buttonState;
    }

    protected override void setDataModel(bool value)
    {
        buttonState = value;
        if (proxy != null)
        {
            proxy.update_value(value);
        }
    }
}
