using UnityEngine;
using System.Collections;
using UnityEditor;

[CustomEditor(typeof(RadialLayout))]
public class RadialLayoutEditor : Editor
{
    public override void OnInspectorGUI()
    {
        DrawDefaultInspector();

        RadialLayout radial = (RadialLayout)target;
        //if (GUILayout.Button("Refresh"))
        //{
        //    radial.PlaceChildren();
        //}
    }
}