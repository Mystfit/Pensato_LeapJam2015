#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using System.Collections;

[CustomEditor(typeof(ArcMesh))]
public class ArcMeshEditor : Editor
{
    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();
        if (GUILayout.Button("Rebuild"))
        {
            ((ArcMesh)target).Build();
        }
    }
}
#endif