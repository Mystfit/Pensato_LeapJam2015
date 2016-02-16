using UnityEngine;
using UnityEditor;
using System.Collections;
using System.Collections.Generic;

public class HexSphere : MonoBehaviour {

    public Transform hexParent;
    public float radius;
    public float panelScale;
    public float handleRadius = 0.1f;

    public AnimationCurve handleFalloff;

    private Vector3[] startDirections;

    void Start () {
        startDirections = new Vector3[hexParent.childCount];
        for(int i = 0; i < hexParent.childCount; i++)
        {
            startDirections[i] = (hexParent.GetChild(i).position - transform.position).normalized;
        }
        SetPanelRadius(radius);
        SetPanelScale(panelScale);
    }

    void Update () {
        SetPanelScale(panelScale);
    }

    public void UpdateHandles(Vector3[] handlePositions)
    {
        for (int i = 0; i < hexParent.childCount; i++)
        {
            Transform panel = hexParent.GetChild(i);
            float panelRadiusScale = radius;
            Vector3 handle = Vector3.zero;

            for (int handleindex = 0; handleindex < handlePositions.Length; handleindex++)
            {
                handle = handlePositions[handleindex];
                Vector3 unmovedPanelPosition = transform.position + (startDirections[i] * radius);
                float largestRadius = Mathf.Max(Vector3.Distance(handle, transform.position), radius);
                float handleToPanelDist = Vector3.Distance(handle, unmovedPanelPosition);
                panelRadiusScale += handleFalloff.Evaluate(Utils.MathTools.Clamp(Utils.MathTools.Remap(handleToPanelDist * handleRadius, 0.0f, largestRadius - radius, 1.0f, 0.0f), 0.0f, 1.0f)) * largestRadius;
            }
            panel.localPosition = startDirections[i] * (panelRadiusScale + radius);
        }
    }

    public void SetPanelRadius(float r)
    {
        radius = r;
        for (int i = 0; i < hexParent.childCount; i++)
        {
            Transform panel = hexParent.GetChild(i);
            panel.localPosition = startDirections[i] * radius;
        }
    }

    public void SetPanelScale(float s)
    {
        panelScale = s;
        for (int i = 0; i < hexParent.childCount; i++)
        {
            Transform panel = hexParent.GetChild(i);
            panel.localScale = new Vector3(panelScale, panelScale, panelScale);
        }
    }
}
