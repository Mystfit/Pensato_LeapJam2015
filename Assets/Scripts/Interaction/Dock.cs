using UnityEngine;
using System.Collections;
using System;

public class Dock : MonoBehaviour, IDockable
{
    protected bool m_dockable;
    public bool IsDockable{get { return m_dockable; }}

    public void ChildLeaving(IGrabbable child){}
    public void ContinueHover(Transform hoverObject){}
    public bool IsCloneable() { return false; }
    public bool IsGrabbed() { return false; }
    public bool IsHovered() { return false; }
    public void OnDropped(Transform droppedObject) { }
    public void OnGrab() { }
    public void OnHoverEnd(Transform hoverObject) { }
    public void OnHoverStart(Transform hoverObject) { }
    public void OnRelease() { }
}
