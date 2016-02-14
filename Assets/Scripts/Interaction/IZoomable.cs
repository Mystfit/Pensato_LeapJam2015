using System;
using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LeapInteractions
{
    public enum ZoomStates { MINIMIZED = 0, MIN_TO_MAX, MAXIMIZED, MAX_TO_MIN };

    /// <summary>
    /// Event that fires when the property 'ZoomState' changes
    /// </summary>
    /// <param name="status">Zoom state</param>
    public delegate void ZoomStatusChanged(ZoomStates status);

    /// <summary>
    /// Interface for objects that need to implement zoomable behaviour (two handed pinch)
    /// </summary>
    public interface IZoomable: IInteractable
    {
        /// <summary>
        /// Zooming status
        /// </summary>
        ZoomStates ZoomState { get; set; }

        /// <summary>
        /// Fired when zooming status has changed
        /// </summary>
        event ZoomStatusChanged onZoomStatusChanged;

        /// <summary>
        /// Start zooming into object
        /// </summary>
        void StartZoom();

        /// <summary>
        /// Update zooming object
        /// </summary>
        void UpdateZoom();

        /// <summary>
        /// Stop zooming object
        /// </summary>
        void StopZoom();

        /// <summary>
        /// Asks the this Zoomable for a new handle to perform the zoom with
        /// </summary>
        /// <returns></returns>
        IGrabbable CreateZoomHandle();

        /// <summary>
        /// Destroys a zoomhandle
        /// </summary>
        /// <returns></returns>
        void DestroyZoomHandle(IGrabbable handle);

        /// <summary>
        /// Return all zoom handles this zoomable object owns
        /// </summary>
        List<IGrabbable> ZoomHandles { get; }

    }
}
