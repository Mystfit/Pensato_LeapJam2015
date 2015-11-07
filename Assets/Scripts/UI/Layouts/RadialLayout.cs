using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System;

[ExecuteInEditMode]
[RequireComponent(typeof(RectTransform))]
public class RadialLayout : LayoutGroup
{

    public float radius;
    public float arcSize;
    public float tilt;
    public float spacing;
    public float startOffset = Mathf.PI * 0.5f;
    public bool fitWidth = false;
    public bool centered = true;

    public GeometryUtils.FacingDirections facingDirection;

    [SerializeField]
    protected bool m_ChildForceExpandWidth = true;
    public bool childForceExpandWidth { get { return m_ChildForceExpandWidth; } set { SetProperty(ref m_ChildForceExpandWidth, value); } }

    [SerializeField]
    protected bool m_ChildForceExpandHeight = true;
    public bool childForceExpandHeight { get { return m_ChildForceExpandHeight; } set { SetProperty(ref m_ChildForceExpandHeight, value); } }

    public override void CalculateLayoutInputHorizontal()
    {
        base.CalculateLayoutInputHorizontal();
        CalcAlongAxis(0, false);
    }

    public override void CalculateLayoutInputVertical()
    {
        CalcAlongAxis(1, false);
    }

    public override void SetLayoutHorizontal()
    {
        PlaceRadial();
    }

    public override void SetLayoutVertical()
    {
        PlaceRadial();
    }

    protected void CalcAlongAxis(int axis, bool isVertical)
    {
        float combinedPadding = (axis == 0 ? padding.horizontal : padding.vertical);

        float totalMin = combinedPadding;
        float totalPreferred = combinedPadding;
        float totalFlexible = 0;

        bool alongOtherAxis = (isVertical ^ (axis == 1));
        for (int i = 0; i < rectChildren.Count; i++)
        {
            RectTransform child = rectChildren[i];
            float min = LayoutUtility.GetMinSize(child, axis);
            float preferred = LayoutUtility.GetPreferredSize(child, axis);
            float flexible = LayoutUtility.GetFlexibleSize(child, axis);
            if ((axis == 0 ? childForceExpandWidth : childForceExpandHeight))
                flexible = Mathf.Max(flexible, 1);

            if (alongOtherAxis)
            {
                totalMin = Mathf.Max(min + combinedPadding, totalMin);
                totalPreferred = Mathf.Max(preferred + combinedPadding, totalPreferred);
                totalFlexible = Mathf.Max(flexible, totalFlexible);
            }
            else
            {
                totalMin += min + spacing;
                totalPreferred += preferred + spacing;

                // Increment flexible size with element's flexible size.
                totalFlexible += flexible;
            }
        }

        if (!alongOtherAxis && rectChildren.Count > 0)
        {
            totalMin -= spacing;
            totalPreferred -= spacing;
        }
        totalPreferred = Mathf.Max(totalMin, totalPreferred);
        SetLayoutInputForAxis(totalMin, totalPreferred, totalFlexible, axis);
    }

    public Vector3[] CalculateRadialPoints()
    {
        float[] widths = null;
        if (fitWidth)
        {
            int axis = 0;
            float size = rectTransform.rect.size[axis];
            float innerSize = size - (axis == 0 ? padding.horizontal : padding.vertical);
            widths = new float[transform.childCount];
            for (int i = 0; i < rectChildren.Count; i++)
            {
                RectTransform rt = transform.GetChild(i).GetComponent<RectTransform>();
                widths[i] = LayoutUtility.GetMinSize(rt, 0);
            }
        }

       return GeometryUtils.BuildArcPositions(radius, arcSize, transform.childCount, spacing, startOffset, centered, widths, facingDirection);
    }

    private void PlaceRadial()
    {
        Vector3[] points = CalculateRadialPoints();
        for (int i = 0; i < points.Length; i++)
        {
            points[i].z = points[i].y;
            points[i].y = 0.0f;
        }

        for (int i = 0; i < rectChildren.Count; i++)
        {
            Quaternion rotation = Quaternion.identity;
            if(childAlignment == TextAnchor.UpperCenter ||
                childAlignment == TextAnchor.MiddleCenter ||
                childAlignment == TextAnchor.LowerCenter)
            {
                rotation = Quaternion.LookRotation(points[i] - transform.position);
            }
            else
            {
                rotation = Quaternion.LookRotation(Vector3.Lerp(points[i], points[i + 1], 0.5f) - transform.position);
            }
            RectTransform child = rectChildren[i];
            child.localPosition = points[i];
            Debug.DrawLine(points[i], points[i] + new Vector3(0.0f, 1.0f, 0.0f));
            child.rotation = rotation;
            //if (facingDirection == GeometryUtils.FacingDirections.INWARDS)
            //    child.rotation = Quaternion.LookRotation(Vector3.Lerp(points[i], points[i + 1], 0.0f) - transform.position);
            //else
            //    child.rotation = Quaternion.LookRotation(Vector3.Lerp(points[i+1], points[i], 0.5f) - transform.position);
            child.Rotate(new Vector3(tilt, 0.0f, 0.0f));
        }
    }


}
