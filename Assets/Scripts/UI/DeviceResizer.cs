using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System;
using Utils;

[ExecuteInEditMode]
public class DeviceResizer : MonoBehaviour, IHidable, IFindsAssets
{
    public float maximizedWidth = 123;
    public float minimizedWidth = 25;
    public float minimizedHeight = 25;
    public float animationSpeed = 0.1f;
    private bool m_isMinimized;
    public bool isMinimized { get { return m_isMinimized; } }
    public bool startMinimized;
    void Awake()
    {
        m_isMinimized = false;
        if (startMinimized) minimize();
    }

    public void minimize()
    {
        loadAssets();

        m_sliders = GetComponentsInChildren<ParamSlider>();
        m_upScrollimages = m_upScroll.GetComponentsInChildren<Image>();
        m_downScrollImages = m_downScroll.GetComponentsInChildren<Image>();

        //foreach (ParamSlider slider in m_sliders)
        //    slider.minimize();

        m_layouts = GetComponentsInChildren<LayoutElement>();
        Color up_off_color = Color.black;
        up_off_color.a = 0.0f;


        //GameObject up_midGraphics = m_upScroll.gameObject.FindInChildren("Button_Plane_Mid");
        //GameObject down_midGraphics = m_downScroll.gameObject.FindInChildren("Button_Plane_Mid");
        //LeanTween.color(up_midGraphics, up_off_color, animationSpeed).setEase(LeanTweenType.easeOutExpo);
        //LeanTween.color(down_midGraphics, up_off_color, animationSpeed).setEase(LeanTweenType.easeOutExpo);
        //LeanTween.alpha(m_upScroll, 0.0f, animationSpeed).setEase(LeanTweenType.easeOutExpo);
        //LeanTween.alpha(m_downScroll, 0.0f, animationSpeed).setEase(LeanTweenType.easeOutExpo).setOnComplete(transitionComplete);
        LeanTween.value(gameObject, updateWidth, maximizedWidth, minimizedWidth, animationSpeed).setEase(LeanTweenType.easeInOutSine);

        foreach (Image img in m_upScrollimages)
            img.CrossFadeAlpha(0.0f, animationSpeed, false);
        foreach (Image img in m_downScrollImages)
            img.CrossFadeAlpha(0.0f, animationSpeed, false);

        LayoutRebuilder.MarkLayoutForRebuild(m_rect);
        m_isMinimized = true;
    }

    private void transitionComplete()
    {
        m_upScroll.gameObject.SetActive(false);
        m_downScroll.gameObject.SetActive(false);
    }

    public void maximize()
    {
        loadAssets();

        m_sliders = GetComponentsInChildren<ParamSlider>();
        //foreach (IHidable slider in m_sliders)
        //    slider.maximize();

        m_layouts = GetComponentsInChildren<LayoutElement>();
        m_upScrollimages = m_upScroll.GetComponentsInChildren<Image>();
        m_downScrollImages = m_downScroll.GetComponentsInChildren<Image>();
        m_upScroll.gameObject.SetActive(true);
        m_downScroll.gameObject.SetActive(true);

        Color up_on_color = m_upScroll.GetComponentInChildren<MomentaryButton>().MidGraphicsOnColor;
        Color down_on_color = m_downScroll.GetComponentInChildren<MomentaryButton>().MidGraphicsOnColor;

        //GameObject up_midGraphics = m_upScroll.gameObject.FindInChildren("Button_Plane_Mid");
        //GameObject down_midGraphics = m_downScroll.gameObject.FindInChildren("Button_Plane_Mid");
        //LeanTween.color(up_midGraphics, up_on_color, animationSpeed).setEase(LeanTweenType.easeInOutSine);
        //LeanTween.color(down_midGraphics, down_on_color, animationSpeed).setEase(LeanTweenType.easeInOutSine);
        //LeanTween.alpha(m_upScroll, 1.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(m_downScroll, 1.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        LeanTween.value(gameObject, updateWidth, minimizedWidth, maximizedWidth, animationSpeed).setEase(LeanTweenType.easeInOutSine);

        foreach (Image img in m_upScrollimages)
            img.CrossFadeAlpha(0.1f, animationSpeed, false);
        foreach (Image img in m_downScrollImages)
            img.CrossFadeAlpha(0.1f, animationSpeed, false);

        LayoutRebuilder.MarkLayoutForRebuild((RectTransform)transform);
        m_isMinimized = false;
    }

    private void updateWidth(float value)
    {
        foreach (LayoutElement elem in m_layouts)
            elem.minWidth = value;

        m_layoutElem.minWidth = value;
        m_rect.sizeDelta = new Vector2(value, m_rect.sizeDelta.y);
        m_title.sizeDelta = new Vector2(value, m_title.sizeDelta.y);
        m_parameters.sizeDelta = new Vector2(value, m_parameters.sizeDelta.y);
        m_viewport.sizeDelta = new Vector2(value, m_viewport.sizeDelta.y);
        m_content.sizeDelta = new Vector2(value, m_content.sizeDelta.y);
    }

    //ASSETS
    private ParamSlider[] m_sliders;
    private LayoutElement[] m_layouts;
    private Image[] m_upScrollimages;
    private Image[] m_downScrollImages;

    private LayoutElement m_layoutElem;
    private RectTransform m_rect;
    public RectTransform m_title;
    public RectTransform m_parameters;
    public RectTransform m_viewport;
    public RectTransform m_content;
    public RectTransform m_upScroll;
    public RectTransform m_downScroll;
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
            m_upScroll = transform.Find("scroll_up").GetComponent<RectTransform>();
            m_downScroll = transform.Find("scroll_down").GetComponent<RectTransform>();
        }
    }
}
