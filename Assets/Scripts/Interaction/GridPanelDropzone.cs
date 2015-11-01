using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System;
using UnityEngine.EventSystems;


public class GridPanelDropzone : MonoBehaviour, IDockable
{
    void Awake()
    {
        m_dockable = true;
    }

    protected bool m_dockable;
    public bool IsDockable { get { return m_dockable; } }

    public void OnDropped(Transform droppedObject)
    {
        throw new NotImplementedException();
    }

    public void OnHoverEnd(Transform hoverObject)
    {
        Debug.Log("Grid hover end!");
    }

    public void OnHoverStart(Transform hoverObject)
    {
        Debug.Log("Grid hover start!");
    }
}