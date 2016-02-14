using UnityEngine;
using System.Collections;
using LeapInteractions;
using System;

public class ExpansionHandle : MonoBehaviour, IGrabbable {

    public Transform attachPoint;
    private SpringJoint _attachSpring;


    private bool _isGrabbed;
    public bool IsGrabbed { get { return _isGrabbed; } }
    private GrabStates _grabStatus;
    public GrabStates GrabState
    {
        get { return _grabStatus; }
        set
        {
            _grabStatus = value;
            if (onGrabStatusChanged != null) onGrabStatusChanged(_grabStatus);
        }
    }

    public event GrabStatusChanged onGrabStatusChanged;

    public void AddGrabPoint(Transform grabPoint)
    {
        throw new NotImplementedException();
    }

    public void StartGrab()
    {
        throw new NotImplementedException();
    }


    public void UpdateGrab()
    {
        throw new NotImplementedException();
    }

    public void EndGrab()
    {
        throw new NotImplementedException();
    }

    private bool _isCloneable;
    public bool IsCloneable { get { return _isCloneable; } }

    public GameObject Clone()
    {
        throw new NotImplementedException();
    }


    void Start () {
        _attachSpring = GetComponent<SpringJoint>();
	}
	
	void Update () {
	}
}
