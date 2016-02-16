using UnityEngine;
using System.Collections;

namespace LeapInteractions
{
    public enum GrabStates { RELEASED = 0, GRABBED };
    public delegate void GrabStatusChanged(GrabStates status);

    public interface IGrabbable: IInteractable
    {
        GrabStates GrabState { get; set; }
        event GrabStatusChanged onGrabStatusChanged;
        void StartGrab(Transform grabPoint);
        void UpdateGrab();
        void EndGrab();

        GameObject Owner { get; }
        Vector3 WorldPosition { get; }
        GameObject Clone();
        bool IsCloneable { get; }
        bool IsGrabbing { get; set; }
    }
}