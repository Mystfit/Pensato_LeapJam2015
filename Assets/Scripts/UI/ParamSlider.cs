using UnityEngine;
using System.Collections;
using System;

public class ParamSlider : SliderDemo, IHidable
{
    private bool m_isMinimized;
    public float minimizedSize = 1.92f;
    public float maximizedSize = 8.4f;

    public bool isMinimized {  get { return m_isMinimized; } }
    public void maximize()
    {
        upperLimit.transform.localPosition = new Vector3(maximizedSize * 0.5f, upperLimit.transform.localPosition.y, upperLimit.transform.localPosition.z);
        lowerLimit.transform.localPosition = new Vector3(maximizedSize * -0.5f, lowerLimit.transform.localPosition.y, lowerLimit.transform.localPosition.z);
        inactiveBar.localScale = new Vector3(1.0f, 1.0f, 1.0f);
    }

    public void minimize()
    {
        upperLimit.transform.localPosition = new Vector3(minimizedSize * 0.5f, upperLimit.transform.localPosition.y, upperLimit.transform.localPosition.z);
        lowerLimit.transform.localPosition = new Vector3(minimizedSize * -0.5f, lowerLimit.transform.localPosition.y, lowerLimit.transform.localPosition.z);
        inactiveBar.localScale = new Vector3(0.0f, 1.0f, 1.0f);
    }

    public Transform inactiveBar;
}
