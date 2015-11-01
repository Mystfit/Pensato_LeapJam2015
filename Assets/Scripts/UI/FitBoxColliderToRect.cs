using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

[ExecuteInEditMode]
[RequireComponent(typeof(RectTransform))]
[RequireComponent(typeof(BoxCollider))]

public class FitBoxColliderToRect : UIBehaviour {
    protected BoxCollider m_collider;

    protected override void OnRectTransformDimensionsChange()
    {
        RectTransform rect = (RectTransform)transform;
        if(m_collider == null) m_collider = GetComponent<BoxCollider>();
        m_collider.size = new Vector3(rect.sizeDelta.x, rect.sizeDelta.y, m_collider.size.z);

        Vector3[] corners = new Vector3[4];
        rect.GetLocalCorners(corners);

        m_collider.center = new Vector3(corners[0].x + rect.sizeDelta.x * 0.5f, corners[0].y + rect.sizeDelta.y * 0.5f, m_collider.center.z);
    }
}
