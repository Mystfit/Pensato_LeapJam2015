/******************************************************************************\
* Copyright (C) Leap Motion, Inc. 2011-2014.                                   *
* Leap Motion proprietary. Licensed under Apache 2.0                           *
* Available at http://www.apache.org/licenses/LICENSE-2.0.html                 *
\******************************************************************************/

using UnityEngine;
using System;
using LeapInteractions;
using System.Collections;

public class VRGrabbable : MonoBehaviour, IGrabbable
{
    void Awake()
    {
    }

    public bool useAxisAlignment = false;
    public Vector3 rightHandAxis;
    public Vector3 objectAxis;

    private bool _rotateQuickly = true;
    public bool rotateQuickly{get { return _rotateQuickly; }}
    public bool centerGrabbedObject = false;

    public Rigidbody breakableJoint;
    public float breakForce;
    public float breakTorque;


    private GrabStates _grabStatus;
    public GrabStates GrabState { get { return _grabStatus; } set { _grabStatus = value; } }
    public bool IsGrabbed { get { return (_grabStatus == GrabStates.GRABBED); } }
    public event GrabStatusChanged onGrabStatusChanged;

    Transform _grabpoint;
    public void AddGrabPoint(Transform grabpoint)
    {
        _grabpoint = grabpoint;
    }

    public void StartGrab()
    {
        GrabState = GrabStates.GRABBED;

        transform.SetParent(null);

        if (breakableJoint != null)
        {
            Joint breakJoint = breakableJoint.GetComponent<Joint>();
            if (breakJoint != null)
            {
                breakJoint.breakForce = breakForce;
                breakJoint.breakTorque = breakTorque;
            }
        }
    }

    public void UpdateGrab()
    {
        throw new NotImplementedException();
    }

    public void EndGrab()
    {
        GrabState = GrabStates.RELEASED;

        if (breakableJoint != null)
        {
            Joint breakJoint = breakableJoint.GetComponent<Joint>();
            if (breakJoint != null)
            {
                breakJoint.breakForce = Mathf.Infinity;
                breakJoint.breakTorque = Mathf.Infinity;
            }
        }
    }


    private bool _cloneable;
    public bool IsCloneable { get { return _cloneable; } set { _cloneable = value; } }
    public virtual GameObject Clone()
    {
        if (!IsCloneable) return null;
        GameObject clone = null;

        clone = GameObject.Instantiate(gameObject);

        if (clone != null)
        {
            clone.transform.SetParent(transform, false);
            clone.transform.SetParent(null, true);
            clone.transform.position = transform.position;
            clone.transform.rotation = transform.rotation;
        }

        return clone;
    }
}
