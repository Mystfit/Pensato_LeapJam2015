using UnityEngine;
using System.Collections;

public class LiveTrackProxyController : LiveProxyController<LiveTrackProxy>
{
    public Transform vr_eye;
    public LiveTrackProxy createTrack(LiveLink live, string id, string name, string parent, Color color)
    {
        Debug.Log("Building track: " + id.ToString());
        LiveTrackProxy track = createProxyUI(id.ToString());
        track.init(live, id, name, parent, color);
        track.gameObject.SetActive(false);
        DeviceLookTracker tracker = track.deviceParent.GetComponent<DeviceLookTracker>();
        tracker.eye = vr_eye;

        return track;
    }
}
