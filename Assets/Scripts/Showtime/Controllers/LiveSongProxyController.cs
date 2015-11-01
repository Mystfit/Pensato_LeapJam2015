using UnityEngine;
using System.Collections;

public class LiveSongProxyController : LiveProxyController<LiveSongProxy>
{
    public GameObject trackSelectPrefab;
    public LiveSongProxy createSong(LiveLink live, string id, string name, string parent)
    {
        Debug.Log("Building song: " + id.ToString());
        LiveSongProxy song = createProxyUI(id.ToString());
        song.init(live, id, name, parent);
        return song;
    }

    public override void registerShowtimeListeners()
    {
        m_live.node.subscribeToMethod(m_live.peer.methods["song_meters"], song_meters);
    }

    private object song_meters(ZST.ZstMethod methodData)
    {
        LiveMessage msg = LiveLink.parseLiveMessage(methodData.output.ToString(), LiveLink.LiveMessageType.ARRAY);
        return null;
    }
}