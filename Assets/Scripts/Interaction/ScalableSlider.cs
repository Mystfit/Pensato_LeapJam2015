using UnityEngine;
using System.Collections;

public class ScalableSlider : VRGrabbable {
    public GameObject m_dragGraphics;

    void Awake()
    {
        if((LiveParameterProxyController)LiveParameterProxyController.instance != null)
            m_dragGraphics = ((LiveParameterProxyController)LiveParameterProxyController.instance).dragPrefab;

        IsCloneable = true;
    }

    public override  GameObject clone()
    {
        if (m_dragGraphics == null) return null;
        GameObject clone = GameObject.Instantiate(m_dragGraphics);
        return clone;
    }
}
