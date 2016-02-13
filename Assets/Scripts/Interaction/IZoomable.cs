using System;
using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LeapInteractions
{
    public enum ZoomStatus { MINIMIZED = 0, MIN_TO_MAX, MAXIMIZED, MAX_TO_MIN };
    public delegate void ZoomStatusChanged(ZoomStatus status);

    /// <summary>
    /// Interface for objects that need to implement zoomable behaviour (two handed pinch)
    /// </summary>
    public interface IZoomable
    {

        /// <summary>
        /// Zooming status
        /// </summary>
        ZoomStatus Zoom { get; set; }

        /// <summary>
        /// Fired when zooming status has changed
        /// </summary>
        event ZoomStatusChanged onZoomStatusChanged;

        /// <summary>
        /// Adds a new attachment point for zooming
        /// </summary>
        /// <param name="attachpoint">Transform to track</param>
        void AddAttachPoint(Transform attachpoint);


        /// <summary>
        /// Removes a zoom attachment point
        /// </summary>
        /// <param name="attachpoint">Transform to stop tracking</param>
        void RemoveAttachPoint(Transform attachpoint);


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
        /// Can this object zoom?
        /// </summary>
        bool IsZoomable { get; }
    }
}
