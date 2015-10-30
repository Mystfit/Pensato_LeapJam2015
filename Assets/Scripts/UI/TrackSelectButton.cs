using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class TrackSelectButton : MonoBehaviour
{
    public LiveTrackProxy m_track;
    private MomentaryButton m_button;
    private Text[] m_labels;
    public void setText(string text)
    {
        for(int i = 0; i < m_labels.Length; i++) m_labels[i].text = text;
    }


    void Awake()
    {
        m_button = GetComponentInChildren<MomentaryButton>();
        m_labels = GetComponentsInChildren<Text>();
        m_button.StartHandler += selectTrack;
    }

    public void init(LiveTrackProxy track)
    {
        m_track = track;
    }

    private void selectTrack(object sender, LMWidgets.EventArg<bool> e)
    {
        if (m_track != null) ((LiveSongProxy)m_track.parent).displayTrack(m_track);
    }
}
