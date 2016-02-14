using UnityEngine;
using System.Collections;

namespace LeapInteractions
{
    public interface IInteractable
    {
        bool IsInteractable{ get; }
        bool IsInteracting { get; }
    }
}
