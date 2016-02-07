using UnityEngine;
using System.Collections;
using System;
using LeapInteractions;

public class GrabbableTracker : MonoBehaviour
{
    public virtual void ChildLeaving(IGrabbable grabbable) {
        Debug.Log("Child leaving top level");
        gameObject.SetActive(false);
    }

    public virtual void ChildArrivedAtDestination(IGrabbable grabbable)
    {
        Debug.Log("Child leaving top level");
        gameObject.SetActive(true);
    }
}
