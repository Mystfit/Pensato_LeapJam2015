using UnityEngine;
using System.Collections;

public class ScalableSlider : PensatoGrabbable {
    public GameObject m_dragGraphics;

    void Awake()
    {
        if((LiveParameterProxyController)LiveParameterProxyController.instance != null)
            m_dragGraphics = ((LiveParameterProxyController)LiveParameterProxyController.instance).dragPrefab;

        scalable_ = true;
        IsCloneable = true;
    }

    public override  GameObject clone()
    {
        if (m_dragGraphics == null) return null;
        GameObject clone = GameObject.Instantiate(m_dragGraphics);
        return clone;
    }
}
