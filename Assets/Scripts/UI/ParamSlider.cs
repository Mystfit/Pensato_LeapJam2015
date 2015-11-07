using UnityEngine;
using System.Collections;
using System;

public class ParamSlider : SliderDemo, IHidable
{
    private bool m_isMinimized;
    public float minimizedSize = 1.92f;
    public float maximizedSize = 8.4f;
    public float animationSpeed = 0.2f;

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
    }

    public void unlockSlider()
    {
        GetComponent<Collider>().enabled = true;
    }

    public Transform label;
    public Transform inactiveBar;
    public Transform root;
}
