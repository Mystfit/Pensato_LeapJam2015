using UnityEngine;
using System.Collections;

public class ScalableSlider : PensatoGrabbable {
    private GameObject m_dragGraphics;

    void Awake()
    {
        m_dragGraphics = ((LiveParameterProxyController)LiveParameterProxyController.instance).dragPrefab;
        scalable_ = true;
        IsCloneable = true;
    }

    public override  GameObject clone()
    {
        GameObject clone = GameObject.Instantiate(m_dragGraphics);
        return clone;
    }
}
