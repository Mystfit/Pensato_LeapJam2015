using System;
using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LeapInteractions
{
    public enum ZoomStatus { MINIMIZED = 0, MIN_TO_MAX, MAXIMIZED, MAX_TO_MIN };

    public interface IZoomable
    {
        ZoomStatus Zoom { get; set; }
        void OnStartZoom();
        void ContinueZoom(Vector3 firstScalePoint, Vector3 secondScalePoint);
        void OnStopZoom();
        bool IsZoomable { get; }
    }
}
