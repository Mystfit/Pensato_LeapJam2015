using System;
using UnityEngine;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LeapInteractions
{
    interface IZoomable
    {
        void OnStartScale();
        void ContinueScale(Vector3 scalerA, Vector3 scalerB);
        void OnStopScale();
        bool IsScaling { get; }
        bool IsScalable { get; }
    }
}
