using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine.EventSystems;

namespace UnityEngine.UI
{
    public class ForceFit : ContentSizeFitter
    {
        public bool fitToChildren = false;

        //Adopted from ContentSizeFitter
        [System.NonSerialized]
        private RectTransform m_Rect;
        private RectTransform rectTransform
        {
            get
            {
                if (m_Rect == null)
                    m_Rect = GetComponent<RectTransform>();
                return m_Rect;
            }
        }

        //Adopted from LayoutGroup
        [System.NonSerialized]
        protected DrivenRectTransformTracker m_Tracker;
        private List<RectTransform> m_RectChildren = new List<RectTransform>();
        protected List<RectTransform> rectChildren { get { return m_RectChildren; } }
        protected LayoutElement m_layout;

        //Adopted from LayoutGroup
        public virtual void CalculateLayoutInputHorizontal()
        {
            m_RectChildren.Clear();
            for (int i = 0; i < rectTransform.childCount; i++)
            {
                RectTransform rect = rectTransform.GetChild(i) as RectTransform;
                if (rect == null)
                    continue;
                ILayoutIgnorer ignorer = rect.GetComponent(typeof(ILayoutIgnorer)) as ILayoutIgnorer;
                if (rect.gameObject.activeInHierarchy && !(ignorer != null && ignorer.ignoreLayout))
                    m_RectChildren.Add(rect);
            }

            //Layout element for holding our overriden minimum width
            if (m_layout == null)
            {
                m_layout = GetComponent<LayoutElement>();
                if (m_layout == null)
                {
                    m_layout = gameObject.AddComponent<LayoutElement>();
                }
            }

            m_Tracker.Clear();
        }

        public override void SetLayoutHorizontal()
        {
            CalculateLayoutInputHorizontal();
            HandleSelfFittingAlongAxis(0);
        }


        //Adopted form ContentSizeFitter
        private void HandleSelfFittingAlongAxis(int axis)
        {
            float totalWidth = 0.0f;
            foreach (RectTransform rect in rectChildren)
            {
                totalWidth += LayoutUtility.GetMinWidth(rect);
            }
            m_layout.minWidth = totalWidth;

            FitMode fitting = (axis == 0 ? horizontalFit : verticalFit);
            if (fitting == FitMode.Unconstrained)
                return;

            m_Tracker.Add(this, rectTransform, (axis == 0 ? DrivenTransformProperties.SizeDeltaX : DrivenTransformProperties.SizeDeltaY));

            // Set size to min or preferred size
            if (fitting == FitMode.MinSize)
                rectTransform.SetSizeWithCurrentAnchors((RectTransform.Axis)axis, LayoutUtility.GetMinSize(m_Rect, axis));
            else
                rectTransform.SetSizeWithCurrentAnchors((RectTransform.Axis)axis, LayoutUtility.GetPreferredSize(m_Rect, axis));
        }

        public void LateUpdate()
        {
        }
    }
}
