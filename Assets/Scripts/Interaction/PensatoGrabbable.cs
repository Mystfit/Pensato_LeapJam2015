/******************************************************************************\
* Copyright (C) Leap Motion, Inc. 2011-2014.                                   *
* Leap Motion proprietary. Licensed under Apache 2.0                           *
* Available at http://www.apache.org/licenses/LICENSE-2.0.html                 *
\******************************************************************************/

using UnityEngine;
using System;
using System.Collections;

public class PensatoGrabbable : MonoBehaviour, IGrabbable
{
    public bool toggleCloneable;
    private LiveProxy m_proxy;

    void Awake()
    {
        m_proxy = GetComponent<LiveProxy>();
    }

    protected bool scaling_;
    protected bool scalable_;
    public bool IsScaling { get { return scaling_; } }
    public bool IsScalable { get { return scalable_; } } 

    private bool cloneable_;
    public bool IsCloneable { get { return cloneable_; } set { cloneable_ = value; } }


    public virtual GameObject clone()
    {
        if (!IsCloneable) return null;
        GameObject clone = null;

        if (m_proxy)
        {
            LiveParameterProxy cloneProxy = (LiveParameterProxy)m_proxy.clone(false);
            clone = cloneProxy.gameObject;
        }
        else
        {
            clone = GameObject.Instantiate(gameObject);
        }

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
        if (IsGrabbed) scaling_ = true;
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

    public void Update()
    {
        if (toggleCloneable)
        {
            IsCloneable = !IsCloneable;
            toggleCloneable = false;
        }
    }

    public void OnStartScale()
    {
        throw new NotImplementedException();
    }

    public void ContinueScale(Vector3 scalerA, Vector3 scalerB)
    {
        throw new NotImplementedException();
    }

    public void OnStopScale()
    {
        throw new NotImplementedException();
    }

    public void ParentDock()
    {
    }

    bool IGrabbable.IsScaling{ get { return false; } }
    bool IGrabbable.IsCloneable { get { return false; } }

    bool IGrabbable.IsHovered
    {
        get
        {
            throw new NotImplementedException();
        }
    }

    //private IDockable m_parentDock;
    //public IDockable Dock
    //{
    //    get {return m_parentDock;}
    //    set {
    //        if(m_parentDock != null){
    //            m_parentDock
    //            m_parentDock.ChildLeaving(this);
    //        }
    //        m_parentDock = value;
    //    }
    //}
}
