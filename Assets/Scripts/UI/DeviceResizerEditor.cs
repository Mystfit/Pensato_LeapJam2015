using UnityEngine;
using UnityEditor;
using UnityEngine.UI;
using System.Collections;

[CustomEditor(typeof(DeviceResizer))]
public class DeviceResizerEditor : Editor
{
    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();

        if (GUILayout.Button("Maximize"))
        {
            ((DeviceResizer)target).maximize();
        }
        if (GUILayout.Button("Minimize"))
        {
            ((DeviceResizer)target).maximize();
        }
    }
}