using UnityEngine;
using System.Collections;

public class LiveSongProxyController : LiveProxyController<LiveSongProxy>
{

    public LiveSongProxy createSong(LiveLink live, string id, string name, string parent)
    {
        Debug.Log("Building song: " + id.ToString());
        LiveSongProxy song = createProxyUI(id.ToString());
        song.init(live, id, name, parent);
        return song;
    }
}