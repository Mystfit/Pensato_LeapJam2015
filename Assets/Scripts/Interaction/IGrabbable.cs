using UnityEngine;
using System.Collections;

public interface IGrabbable
{
    void OnGrab();
    void OnRelease();
    void OnStartHover();
    void OnStopHover();
    bool IsGrabbed {get; }
    bool IsCloneable { get; }
    bool IsHovered { get; }

    void OnStartScale();
    void ContinueScale(Vector3 scalerA, Vector3 scalerB);
    void OnStopScale();
    bool IsScaling { get; }
    bool IsScalable { get; }
}
