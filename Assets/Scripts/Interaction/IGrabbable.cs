using UnityEngine;
using System.Collections;

namespace LeapInteractions
{
    public enum GrabStatus { RELEASED = 0, GRABBED };
    public delegate void GrabStatusChanged(GrabStatus status);

    public interface IGrabbable
    {
        GrabStatus Grab { get; set; }
        event GrabStatusChanged onGrabStatusChanged;
        void AddGrabPoint(Transform grabPoint);
        void StartGrab();
        void UpdateGrab();
        void EndGrab();
        bool IsGrabbed { get; }

        GameObject Clone();
        bool IsCloneable { get; }
    }
}