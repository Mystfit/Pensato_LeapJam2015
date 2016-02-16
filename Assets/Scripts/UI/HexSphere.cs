using UnityEngine;
using UnityEditor;
using System.Linq;
using System.Collections;
using System.Collections.Generic;

public class HexSphere : MonoBehaviour {

    public Transform hexParent;
    public float radius;
    public float panelScale;
    public float handleRadius = 0.1f;
    public List<Transform> manualHandles;

    public AnimationCurve handleFalloff;

    private Vector3[] startDirections;

    void Start () {
        //manualHandles = new List<Transform>();
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
        if(manualHandles.Count > 0)
        {
            for(int i = 0; i < manualHandles.Count; i++)
            {
                UpdateHandles(manualHandles.Select(handle => handle.position).ToArray());
            }
        }
    }

    public void UpdateHandles(Vector3[] handlePositions)
    {
        for (int i = 0; i < hexParent.childCount; i++)
        {
            Transform panel = hexParent.GetChild(i);
            float panelRadiusScale = radius;
            Vector3 handle = Vector3.zero;
            float largest = 0.0f;
            for (int handleindex = 0; handleindex < handlePositions.Length; handleindex++)
            {
                handle = handlePositions[handleindex];
                Vector3 unmovedPanelPosition = transform.position + (startDirections[i] * radius);
                float largestRadius = Mathf.Max(Vector3.Distance(handle, transform.position), radius);
                float handleToPanelDist = Vector3.Distance(handle, unmovedPanelPosition);
                panelRadiusScale += handleFalloff.Evaluate(Utils.MathTools.Clamp(Utils.MathTools.Remap(handleToPanelDist * handleRadius, 0.0f, largestRadius - radius, 1.0f, 0.0f), 0.0f, 1.0f));
                largest = Mathf.Max(largestRadius, largest);
            }
            panel.localPosition = startDirections[i] * ( radius + (panelRadiusScale * largest));
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
