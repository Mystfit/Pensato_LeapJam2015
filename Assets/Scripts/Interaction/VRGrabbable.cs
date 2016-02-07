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
    public bool toggleCloneable;

    void Awake()
    {
    }

    private bool m_cloneable;
    public bool IsCloneable { get { return m_cloneable; } set { m_cloneable = value; } }

    public virtual GameObject clone()
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

    public bool useAxisAlignment = false;
    public Vector3 rightHandAxis;
    public Vector3 objectAxis;

    private bool m_rotateQuickly = true;
    public bool rotateQuickly{get { return m_rotateQuickly; }}
    public bool centerGrabbedObject = false;

    public Rigidbody breakableJoint;
    public float breakForce;
    public float breakTorque;

    protected bool grabbed_ = false;
    protected bool hovered_ = false;
    public bool IsHovered()
    {
        return hovered_;
    }

    public bool IsGrabbed { get { return grabbed_; } }

    public virtual void OnStartHover()
    {
        hovered_ = true;
    }

    public virtual void OnStopHover()
    {
        hovered_ = false;
    }

    public virtual void OnGrab()
    {
        grabbed_ = true;
        hovered_ = false;
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

    public virtual void OnRelease()
    {
        grabbed_ = false;

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

    bool IGrabbable.IsCloneable { get { return false; } }
    bool IGrabbable.IsHovered
    {
        get
        {
            throw new NotImplementedException();
        }
    }
}
