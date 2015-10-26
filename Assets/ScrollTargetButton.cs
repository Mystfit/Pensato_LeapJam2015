﻿using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class ScrollTargetButton : MonoBehaviour {

    private MomentaryButton m_button;
    public RectTransform target;
    public int byRows = 1;

    public enum VerticalScrollDirection {  UP = 0, DOWN};
    public VerticalScrollDirection scrollDirection;

	void Awake () {
        m_button = GetComponentInChildren<MomentaryButton>();
        m_button.StartHandler += pulseScroll;
    }

    private void pulseScroll(object sender, LMWidgets.EventArg<bool> e)
    {
        float rowHeight = LayoutUtility.GetMinHeight((RectTransform)target.GetChild(0));
        if (scrollDirection == VerticalScrollDirection.DOWN)
            target.localPosition = new Vector3(target.localPosition.x, target.localPosition.y - (rowHeight * byRows), target.localPosition.z);
        else if(scrollDirection == VerticalScrollDirection.UP)
            target.localPosition = new Vector3(target.localPosition.x, target.localPosition.y + (rowHeight * byRows), target.localPosition.z);
    }
}
