using UnityEngine;
using System.Collections;

namespace LeapInteractions
{
    public enum GrabStates { RELEASED = 0, GRABBED };
    public delegate void GrabStatusChanged(GrabStates status);

    public interface IGrabbable
    {
        GrabStates GrabState { get; set; }
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