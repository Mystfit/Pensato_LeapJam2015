using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System;
using UnityEngine.EventSystems;


public class GridPanelDropzone : MonoBehaviour, IDockable
{
    //Assumes: SnapGridLayoutGroup component
    private SnapGridLayoutGroup m_snapGrid;
    private SnapGridCell m_hoverSnapCell;
    private GameObject m_activeHoverGuide;
    public GameObject m_hoverGuideGraphics;

    void Awake()
    {
        m_snapGrid = GetComponent<SnapGridLayoutGroup>();
        m_dockable = true;
    }

    protected bool m_dockable;
    public bool IsDockable { get { return m_dockable; } }

    public void OnDropped(Transform droppedObject)
    {
        Rigidbody rigid = droppedObject.GetComponent<Rigidbody>();
        rigid.velocity = Vector3.zero;
        rigid.angularVelocity = Vector3.zero;
        SnapGridCell cell = droppedObject.gameObject.AddComponent<SnapGridCell>();
        droppedObject.SetParent(transform);
        droppedObject.localPosition = new Vector3(droppedObject.localPosition.x, droppedObject.localPosition.y, 0.0f);
        droppedObject.localRotation = Quaternion.identity;
        SetChildGridposition(droppedObject, cell);
    }

    public void OnHoverStart(Transform hoverObject)
    {
        m_activeHoverGuide = GameObject.Instantiate(m_hoverGuideGraphics);
        m_activeHoverGuide.transform.SetParent(transform, false);
        m_hoverSnapCell = m_activeHoverGuide.AddComponent<SnapGridCell>();
        m_hoverSnapCell.x = m_hoverSnapCell.y = m_hoverSnapCell.width = m_hoverSnapCell.height = 1;
        UpdateHoverGraphics(hoverObject);
    }

    public void OnHoverEnd(Transform hoverObject)
    {
        m_hoverSnapCell = null;
        GameObject.Destroy(m_activeHoverGuide);
    }

    public void ContinueHover(Transform hoverObject)
    {
        if(m_hoverSnapCell != null) UpdateHoverGraphics(hoverObject);
    }

    private void UpdateHoverGraphics(Transform hoverObject)
    {
        SetChildGridposition(hoverObject, m_hoverSnapCell);
    }

    private void SetChildGridposition(Transform child, SnapGridCell cell)
    {
        RectTransform rect = (RectTransform)child;
        Vector3[] corners = new Vector3[4];
        rect.GetWorldCorners(corners);

        int[] coordinates = m_snapGrid.PositionToCellCoordinates(corners[0]);
        int[] sizes = m_snapGrid.RectToCellSizes((RectTransform)child);
        int[] offset = new int[2];
        //int[] offset = m_snapGrid.CalculateOverlapOffset(cell, Math.Max(coordinates[0], 0), Math.Max(coordinates[1], 0));
        cell.x = coordinates[0] + offset[0];
        cell.y = coordinates[1] + offset[1];
        cell.width = sizes[0];
        cell.height = sizes[1];
    }
}