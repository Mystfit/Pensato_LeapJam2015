using UnityEngine;
using System.Collections;

public interface IGrabbable
{
    void OnGrab();
    void OnRelease();
    bool IsGrabbed {get; }
    bool IsScaling();
    bool IsCloneable();
    bool IsHovered();
}
