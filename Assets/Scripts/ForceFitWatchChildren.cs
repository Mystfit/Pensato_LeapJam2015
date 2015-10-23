using UnityEngine;
using Utils;
using System.Collections;
using UnityEngine.UI;

[ExecuteInEditMode]
public class ForceFitWatchChildren : MonoBehaviour
{
    protected RectTransform m_rect;
    protected ContentSizeFitter m_fitter;

    public void Start()
    {
        m_rect = transform.GetComponent<RectTransform>();
        m_fitter = gameObject.GetComponent<ContentSizeFitter>();
    }

    // Callback that is sent if an associated RectTransform is removed
    public void OnRectTransformRemoved()
    {
        m_rect = null;
    }

    public void OnTransformChildrenChanged()
    {
        if (m_rect != null) LayoutRebuilder.MarkLayoutForRebuild(m_rect);
    }
}
