using UnityEngine;
using UnityEditor;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using Utils;

public class HexSphere : MonoBehaviour {

    public Transform hexParent;
    public GameObject innerSphere;
    public List<Transform> manualHandles;

    public float radius;
    public float panelScale;
    public float handleRadius = 0.1f;
    public float nearFade = -0.3f;
    public float farFade = 14.0f;
    public AnimationCurve handleFalloff;

    private Vector3[] startDirections;
    private Material _innerMat;

    void Start () {
        //manualHandles = new List<Transform>();
        startDirections = new Vector3[hexParent.childCount];
        for(int i = 0; i < hexParent.childCount; i++)
        {
            startDirections[i] = (hexParent.GetChild(i).position - transform.position).normalized;
        }

        //SetPanelRadius(handleRadius);
        UpdatePanelScale(panelScale);
        _innerMat = innerSphere.GetComponent<Renderer>().material;
    }

    void Update () {
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

    public void Animate(float duration, float r)
    {
        Animate(duration, r, false);
    }

    public void Animate(float duration, float r, bool collapse)
    {
        radius = r;
        Debug.Log("Expanding shell to radius " + radius);
        LeanTweenType ease = LeanTweenType.easeOutQuint;
        LeanTween.value(gameObject, (collapse) ? 1.0f : 0.0f, (collapse) ? 0.0f : 1.0f, duration).setOnUpdate(UpdateSphereSize).setEase(ease);
        for (int i = 0; i < hexParent.childCount; i++)
        {
            LeanTween.moveLocal(hexParent.GetChild(i).gameObject, startDirections[i] * radius, duration).setEase(ease);
        }
        LeanTween.scale(innerSphere, new Vector3(radius * 2, radius * 2, radius * 2), duration).setEase(ease);
    }

    private void UpdateSphereSize(float t)
    {
        UpdateInnerFresnel(t);
        UpdatePanelCloseFade(t);
        //UpdatePanelRadius(MathTools.Remap(t, 0.0f, 1.0f, _startRadius, _endRadius));
    }

    private void UpdateInnerFresnel(float fresnel)
    {
        _innerMat.SetFloat("_Fresnel", fresnel);
    }

    private void UpdatePanelCloseFade(float blend)
    {
        Renderer[] renderer = GetComponentsInChildren<Renderer>();
        for (int i = 0; i < renderer.Length; i++)
        {
            renderer[i].material.SetFloat("_Near", MathTools.Remap(blend, 1.0f, 0.0f, nearFade, 100.0f));
            renderer[i].material.SetFloat("_Far", MathTools.Remap(blend, 1.0f, 0.0f, farFade, 100.0f));
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

    private void UpdatePanelScale(float s)
    {
        panelScale = s;
        for (int i = 0; i < hexParent.childCount; i++)
        {
            Transform panel = hexParent.GetChild(i);
            panel.localScale = new Vector3(panelScale, panelScale, panelScale);
        }
    }
}
