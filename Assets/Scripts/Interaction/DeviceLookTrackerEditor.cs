#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(DeviceLookTracker))]
public class DeviceLookTrackerEditor : Editor
{
    private int m_activePanel;

    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();
        DeviceLookTracker tracker = (DeviceLookTracker)target;

        m_activePanel = EditorGUILayout.IntSlider("Active device", m_activePanel, 0, tracker.transform.childCount-1);
        if (GUILayout.Button("Set device active"))
        {
            tracker.overrideActiveDevice = m_activePanel;
        }
    }
}

#endif