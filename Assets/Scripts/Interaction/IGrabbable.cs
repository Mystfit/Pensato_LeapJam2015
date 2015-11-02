using UnityEngine;
using System.Collections;

public interface IGrabbable
{
    void OnGrab();
    void OnRelease();
    void OnStartHover();
    void OnStopHover();
    bool IsGrabbed {get; }
    bool IsScaling { get; }
    bool IsCloneable { get; }
    bool IsHovered { get; }
}
