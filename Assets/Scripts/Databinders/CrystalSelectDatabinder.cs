using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using LMWidgets;
using Utils;
using System;

public class CrystalSelectDatabinder : DataBinderToggle
{
    public LiveTrackProxy track;
    public ButtonDemoToggle button;
    public GameObject lockedGraphics;
    protected bool buttonState;
    private LiveProxy m_proxy;
    private Text[] m_labels;

    public void setText(string text)
    {
        if (m_labels == null)
            m_labels = GetComponentsInChildren<Text>();
        for (int i = 0; i < m_labels.Length; i++)
            m_labels[i].text = text;
    }

    public void init(LiveProxy proxy, ButtonDemoToggle button)
    {
        track = (LiveTrackProxy)proxy;
        this.button = button;
        AddWidget(button);
    }

    public override bool GetCurrentData()
    {
        return buttonState;
    }

    protected override void setDataModel(bool value)
    {
        buttonState = value;
        if (value)
        {
            if (track != null) ((LiveSongProxy)track.parent).displayTrack(this);
            lockGraphics();
        } else
        {
            unlockGraphics();
        }
    }

    public void lockGraphics()
    {
        button.Interactable = false;
        lockedGraphics.SetActive(true);
        button.GetComponent<Collider>().enabled = false;
    }

    public void unlockGraphics()
    {
        button.Interactable = true;
        lockedGraphics.SetActive(false);
        button.GetComponent<Collider>().enabled = true;
    }
}
