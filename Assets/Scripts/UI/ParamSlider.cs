using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System;
using LMWidgets;

public class ParamSlider : SliderDemo, IHidable
{
    public Image rotaryImage;
    public Transform label;
    public Transform inactiveBar;
    public RectTransform root;
    public LayoutElement rootLayout;

    private bool m_isMinimized;
    public float minimizedSize = 1.92f;
    public float maximizedSize = 8.4f;
    public float animationSpeed = 0.2f;
    public bool showRadial = false;

    public bool isMinimized {  get { return m_isMinimized; } }
    public void maximize()
    {
        //LeanTween.alpha(activeBar.gameObject, 1.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(inactiveBar.gameObject, 0.5f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(upperLimit.gameObject, 1.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(lowerLimit.gameObject, 1.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(topLayer.gameObject, 1.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(midLayer.gameObject, 1.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        upperLimit.transform.localPosition = new Vector3(maximizedSize * 0.5f, upperLimit.transform.localPosition.y, upperLimit.transform.localPosition.z);
        lowerLimit.transform.localPosition = new Vector3(maximizedSize * -0.5f, lowerLimit.transform.localPosition.y, lowerLimit.transform.localPosition.z);
        label.gameObject.SetActive(true);
        inactiveBar.localScale = new Vector3(0.78f, 1.0f, 1.0f);
        unlockSlider();
        root.sizeDelta = new Vector2(110.0f, root.sizeDelta.y);

        rootLayout.minWidth = minimizedSize * 13.5f;
        LeanTween.alpha(gameObject, 1.0f, animationSpeed).setEase(LeanTweenType.easeInExpo); 
    }

    public void minimize()
    {
        //LeanTween.alpha(activeBar.gameObject, 0.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(inactiveBar.gameObject, 0.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(upperLimit.gameObject, 0.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(lowerLimit.gameObject, 0.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(topLayer.gameObject, 0.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        //LeanTween.alpha(midLayer.gameObject, 0.0f, animationSpeed).setEase(LeanTweenType.easeInExpo);
        LeanTween.alpha(gameObject, 1.0f, animationSpeed).setEase(LeanTweenType.easeInExpo).setOnComplete(() => {
            rootLayout.minWidth = maximizedSize * 13.5f;
            root.sizeDelta = new Vector2(25.0f, root.sizeDelta.y);

            upperLimit.transform.localPosition = new Vector3(minimizedSize * 0.5f, upperLimit.transform.localPosition.y, upperLimit.transform.localPosition.z);
            lowerLimit.transform.localPosition = new Vector3(minimizedSize * -0.5f, lowerLimit.transform.localPosition.y, lowerLimit.transform.localPosition.z);
            inactiveBar.localScale = new Vector3(0.0f, 1.0f, 1.0f);
            label.gameObject.SetActive(false);
            lockSlider();
        });
    }

    public void lockSlider()
    {
        GetComponent<Collider>().enabled = false;
        if (rotaryImage != null)
            rotaryImage.enabled = true;
    }

    public void unlockSlider()
    {
        GetComponent<Collider>().enabled = true;
        if (rotaryImage != null)
            rotaryImage.enabled = false;
    }

    protected override void Awake()
    {
        base.Awake();
        ChangeHandler += updateRadial;
    }

    protected void updateRadial(object sender, LMWidgets.EventArg<float> e)
    {
        if (rotaryImage != null && showRadial)
            rotaryImage.fillAmount = e.CurrentValue;
    }
}
