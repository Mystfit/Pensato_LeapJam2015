using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System;

public class DeviceResizer : MonoBehaviour, IHidable, IFindsAssets
{
    public float maximizedWidth = 123;
    public float minimizedWidth = 25;

    public float minimizedHeight = 25;

    private bool m_isMinimized;
    public bool isMinimized { get { return m_isMinimized; } }

    void Awake()
    {
        loadAssets();
        m_isMinimized = false;
    }

    public void minimize()
    {
        loadAssets();

        m_sliders = GetComponentsInChildren<ParamSlider>();
        foreach (ParamSlider slider in m_sliders)
            slider.minimize();

        LayoutElement[] layouts = GetComponentsInChildren<LayoutElement>();
        foreach(LayoutElement elem in layouts)
            elem.minWidth = minimizedWidth;

        m_layoutElem.minWidth = minimizedWidth;
        m_rect.sizeDelta = new Vector2(minimizedWidth, m_rect.sizeDelta.y);
        m_title.sizeDelta = new Vector2(minimizedWidth, m_title.sizeDelta.y);
        m_parameters.sizeDelta = new Vector2(minimizedWidth, m_parameters.sizeDelta.y);
        m_viewport.sizeDelta = new Vector2(minimizedWidth, m_viewport.sizeDelta.y);
        m_content.sizeDelta = new Vector2(minimizedWidth, m_content.sizeDelta.y);

        LayoutRebuilder.MarkLayoutForRebuild(m_rect);
        m_isMinimized = true;
    }

    public void maximize()
    {
        loadAssets();

        foreach (IHidable slider in m_sliders)
            slider.maximize();

        LayoutElement[] layouts = GetComponentsInChildren<LayoutElement>();
        foreach (LayoutElement elem in layouts)
            elem.minWidth = maximizedWidth;

        m_layoutElem.minWidth = maximizedWidth;
        m_rect.sizeDelta = new Vector2(maximizedWidth, m_rect.sizeDelta.y);
        m_title.sizeDelta = new Vector2(maximizedWidth, m_title.sizeDelta.y);
        m_parameters.sizeDelta = new Vector2(maximizedWidth, m_parameters.sizeDelta.y);
        m_viewport.sizeDelta = new Vector2(maximizedWidth, m_viewport.sizeDelta.y);
        m_content.sizeDelta = new Vector2(maximizedWidth, m_content.sizeDelta.y);

        LayoutRebuilder.MarkLayoutForRebuild((RectTransform)transform);
        m_isMinimized = false;
    }

    //ASSETS
    private ParamSlider[] m_sliders;
    private LayoutElement m_layoutElem;
    private RectTransform m_rect;
    public RectTransform m_title;
    public RectTransform m_parameters;
    public RectTransform m_viewport;
    public RectTransform m_content;
    public void loadAssets()
    {
        if (m_rect == null ||
            m_title == null ||
            m_parameters == null ||
            m_viewport == null ||
            m_content == null
        )
        {
            m_layoutElem = GetComponent<LayoutElement>();
            m_rect = (RectTransform)transform;
            m_title = transform.Find("title_panel").GetComponent<RectTransform>();
            m_parameters = transform.Find("parameters").GetComponent<RectTransform>();
            m_viewport = m_parameters.Find("viewport").GetComponent<RectTransform>();
            m_content = m_viewport.Find("content").GetComponent<RectTransform>();
        }
    }
}
