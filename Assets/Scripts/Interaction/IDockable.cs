using UnityEngine;
using System.Collections;

public interface IDockable
{
    void OnDropped(Transform droppedObject);
    void OnHoverStart(Transform hoverObject);
    void OnHoverEnd(Transform hoverObject);
    void ContinueHover(Transform hoverObject);
    bool IsDockable { get; }
}
