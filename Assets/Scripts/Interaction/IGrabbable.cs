using UnityEngine;
using System.Collections;

namespace LeapInteractions
{
    public interface IGrabbable
    {
        void OnGrab();
        void OnRelease();
        void OnStartHover();
        void OnStopHover();
        bool IsGrabbed {get; }
        bool IsCloneable { get; }
        bool IsHovered { get; }
        bool rotateQuickly { get; }
    }
}