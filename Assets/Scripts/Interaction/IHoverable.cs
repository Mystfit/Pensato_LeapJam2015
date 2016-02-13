using UnityEngine;
using System.Collections;

namespace LeapInteractions
{
    public interface IHoverable
    {
        void StartHover();
        void UpdateHover();
        void StopHover();
        bool IsHovered { get; }
    }
}
