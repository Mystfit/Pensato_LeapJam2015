using UnityEngine;
using System.Collections;

namespace LeapInteractions
{
    public interface IDockable
    {
        void OnDropped(Transform droppedObject);
        void OnHoverStart(Transform hoverObject);
        void OnHoverEnd(Transform hoverObject);
        void ContinueHover(Transform hoverObject);
        void ChildLeaving(IGrabbable child);
        bool IsDockable { get; }
    }
}
