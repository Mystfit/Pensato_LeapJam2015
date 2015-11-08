using UnityEngine;
using Utils;
using System.Collections;
using System;

public class LiveSongProxy : LiveProxy {

    //ASSUME: Have track holder
    private Transform trackParent;
    private Transform trackPickerParent;

    private CrystalSelectDatabinder m_activeTrackBtn;
    public LiveTrackProxy activeTrack { get { return m_activeTrackBtn.track; } } 

    void Awake () {
        isCloneable = false;
        trackParent = transform.Find("tracks").transform;
        trackPickerParent = transform.GetChild(1);// gameObject.FindInChildren("track_picker").transform;
    }

    public override bool AddChild(LiveProxy proxy)
    {
        proxy.transform.SetParent(trackParent, false);
        if (proxy.GetType() == typeof(LiveTrackProxy)) createTrackSelectButton((LiveTrackProxy)proxy);

        return base.AddChild(proxy);
    }


    public override void update_value(object value){}
    public override void receive_value(object value){}

    public void createTrackSelectButton(LiveTrackProxy track)
    {
        GameObject trackBtn = GameObject.Instantiate(((LiveSongProxyController)LiveSongProxyController.instance).trackSelectPrefab);
        CrystalSelectDatabinder btn = trackBtn.GetComponent<CrystalSelectDatabinder>();
        btn.setText(track.proxyName);
        btn.init(track, trackBtn.GetComponentInChildren<ButtonDemoToggle>());
        track.deviceParent.GetComponent<RadialHologram>().origin = btn.transform;
        btn.track = track;
        btn.transform.SetParent(trackPickerParent, false);
    }

    public void displayTrack(CrystalSelectDatabinder trackBtn)
    {
        if (m_activeTrackBtn == trackBtn)
            return;
        if (m_activeTrackBtn != null)
        {
            m_activeTrackBtn.SetCurrentData(false);
            m_activeTrackBtn.track.gameObject.SetActive(false);
        }
        m_activeTrackBtn = trackBtn;
        m_activeTrackBtn.SetCurrentData(true);
        m_activeTrackBtn.track.gameObject.SetActive(true);
    }
}
