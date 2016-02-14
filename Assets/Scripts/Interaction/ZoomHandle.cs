using UnityEngine;
using System.Collections;
using LeapInteractions;
using System;

public class ZoomHandle : MonoBehaviour, IGrabbable {

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

    private Transform _grabPoint;
    public void StartGrab(Transform grabPoint)
    {
        _grabPoint = grabPoint;
        _isInteracting = true;
    }


    public void UpdateGrab()
    {
        if(_isInteracting && _grabPoint != null)
        {
            transform.position = _grabPoint.position;
        }
    }

    public void EndGrab()
    {
        _grabPoint = null;
        _isInteracting = false;
    }

    private bool _isCloneable;
    public bool IsCloneable { get { return _isCloneable; } }

    private bool _isInteractable;
    public bool IsInteractable { get { return _isInteractable; } }

    private bool _isInteracting;
    public bool IsInteracting { get { return _isInteracting; } }

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
