using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

public class LiveSongProxyController : LiveProxyController<LiveSongProxy>
{
    public GameObject trackSelectPrefab;
    public Transform library;
    private Dictionary<string, float> m_trackData;
    public Dictionary<string, float> trackData { get { return m_trackData; } }

    protected override void Awake()
    {
        Dictionary<string, float> m_trackData = new Dictionary<string, float>();
        base.Awake();
    }

    public LiveSongProxy createSong(LiveLink live, string id, string name, string parent)
    {
        Debug.Log("Building song: " + id.ToString());
        LiveSongProxy song = createProxyUI(id.ToString());
        song.init(live, id, name, parent);
        song.transform.SetParent(library, false);
        return song;
    }

    public override void registerShowtimeListeners()
    {
        m_live.node.subscribeToMethod(m_live.peer.methods["song_meters"], song_meters);
    }

    private object song_meters(ZST.ZstMethod methodData)
    {
        LiveMessage msg = LiveLink.parseLiveMessage(methodData.output.ToString(), LiveLink.LiveMessageType.OBJECT);

        Dictionary<string, object> trackData = msg.dict;

        LiveTrackProxyController controller = (LiveTrackProxyController)LiveTrackProxyController.instance;
        foreach (KeyValuePair<string, object> pair in trackData)
        {
            if (controller.proxies.ContainsKey(pair.Key))
            {
                controller.proxies[pair.Key].amplitudeJack.UpdateJack(float.Parse(pair.Value.ToString()));
            }
        }
        return null;
    }
}