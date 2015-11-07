using UnityEngine;
using Utils;
using System.Collections;
using System;

public class LiveSongProxy : LiveProxy {

    //ASSUME: Have track holder
    private Transform trackParent;
    private Transform trackPickerParent;

    private LiveTrackProxy m_activeTrack;
    public LiveTrackProxy activeTrack { get { return m_activeTrack; } } 

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
        TrackSelectButton btn = trackBtn.GetComponent<TrackSelectButton>();
        btn.setText(track.proxyName);
        track.deviceParent.GetComponent<RadialHologram>().origin = btn.transform;
        btn.m_track = track;
        btn.transform.SetParent(trackPickerParent, false);
    }

    public void displayTrack(LiveTrackProxy track)
    {
        if(activeTrack != null) m_activeTrack.gameObject.SetActive(false);
        m_activeTrack = track;
        m_activeTrack.gameObject.SetActive(true);
    }
}
