using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using LeapInteractions;
using System;
using System.Linq;
using LMWidgets;

public class VRShell : MonoBehaviour, IZoomable, IGrabbable
{
    /*
    *  Shell 
    */
    public HexSphere outerShell;

    //Shell sizes
    public float collapsedShellRadius = 0.016f;
    public float interactableShellRadius = 0.37f;
    public float distantShellRadius = 2.0f;
    public float zoomThreshold = 0.1f;
    public float compressionTrigger = 0.05f;

    //Shell states
    public enum ShellStates
    {
        COLLAPSED = 0,
        COLLAPSED_EXPANDING,
        INTERACTABLE_COLLAPSING,
        INTERACTABLE,
        INTERACTABLE_EXPANDING,
        DISTANT_COLLAPSING,
        DISTANT
    };
    public delegate void ShellStateChanged(ShellStates state);
    public event ShellStateChanged onShellStateChanged;
    private ShellStates _shellState;
    public ShellStates ShellState
    {
        get { return _shellState; }
        set
        {
            _shellState = value;
            if (onShellStateChanged != null) onShellStateChanged(_shellState);
        }
    }

    //Shell hierarchy
    private VRShell _parentShell;
    public VRShell parent { get { return _parentShell; } }
    public void SetParentShell(VRShell parent) { _parentShell = parent; }

    private HashSet<VRShell> _childShells;
    public HashSet<VRShell> children { get { return _childShells; } }
    public void AddChildShell(VRShell shell)
    {
        _childShells.Add(shell);
        shell.SetParentShell(this);
    }
    public void RemoveChildShell(VRShell shell)
    {
        _childShells.Remove(shell);
        shell.SetParentShell(null);
    }

    //Shell actions
    public void Expand()
    {
        ShellState = ShellStates.COLLAPSED_EXPANDING;
        GetComponent<SphereCollider>().radius = interactableShellRadius;
        ClearZoomHandles();
        SetCompressorButtonActive(true);
        outerShell.SetPanelRadius(interactableShellRadius);
    }

    public void Collapse()
    {
        ShellState = ShellStates.COLLAPSED;
        GetComponent<SphereCollider>().radius = collapsedShellRadius;
        SetCompressorButtonActive(false);
        outerShell.SetPanelRadius(collapsedShellRadius);
    }

    public void Swipe(HandleSide fromSide)
    {
        Collapse();
    }

    public void OnTriggerExit(Collider other)
    {
        if (other.gameObject.GetComponent<HandAttachment>() != null)
        {

        }
    }


    /*
    *  Grabbing
    */
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
        if (IsInteractable)
        {
            _grabPoint = grabPoint;
            IsGrabbing = true;
        }
    }

    public void UpdateGrab()
    {
        if (_isInteracting && _grabPoint != null)
        {
            transform.position = _grabPoint.position;
            Debug.Log(transform.position);
        }
    }

    public void EndGrab()
    {
        _grabPoint = null;
        IsGrabbing = false;
    }

    public GameObject Owner { get { return gameObject; } }
    public Vector3 WorldPosition { get { return transform.position; } }

    public GameObject Clone()
    {
        throw new NotImplementedException();
    }
    private bool _isCloneable;
    public bool IsCloneable { get { return _isCloneable; } }

    private bool _isInteractable;
    public bool IsInteractable { get { return _isInteractable; } }

    private bool _isInteracting;
    public bool IsInteracting { get {
            return _isInteracting; } }



    /*
    *  Zoom
    */
    public event ZoomStatusChanged onZoomStatusChanged;
    private ZoomStates _zoomstatus;
    public ZoomStates ZoomState { get { return _zoomstatus; } set { _zoomstatus = value; } }

    private bool _isZooming;
    public bool IsZooming {
        get { return _isZooming; }
        set {
            _isZooming = value;
            _isInteracting = value || _isGrabbing;
        }
    }

    private bool _isGrabbing;
    public bool IsGrabbing {
        get { return _isGrabbing; }
        set {
            _isGrabbing = value;
            _isInteracting = value || _isZooming; ;
        }
    }

    public GameObject zoomHandlePrefab;
    private List<IGrabbable> _zoomHandles;
    public List<IGrabbable> ZoomHandles { get { return _zoomHandles; } }

    public IGrabbable CreateZoomHandle()
    {
        GameObject handle = GameObject.Instantiate(zoomHandlePrefab);
        IGrabbable grabbable = handle.GetComponent<IGrabbable>();
        _zoomHandles.Add(grabbable);
        if (_zoomHandles.Count >= 2)
            StartZoom();
        return grabbable;
    }

    public void DestroyZoomHandle(IGrabbable handle)
    {
        _zoomHandles.Remove(handle);
    }

    public void StartZoom()
    {
        if (IsInteractable)
        {
            IsZooming = true;
        }
    }

    public void UpdateZoom()
    {
        CheckZoomHandles();

        if (_zoomHandles.Count == 0 && IsZooming)
        {
            StopZoom();
        }

        //Check if we can expand the shell
        int handleCount = 0;
        for (int i = 0; i < _zoomHandles.Count; i++)
        {
            _zoomHandles[i].UpdateGrab();
            float dist = Vector3.Distance(ZoomHandles[i].WorldPosition, transform.position);
            if (dist > zoomThreshold)
                handleCount++;
        }

        //Update hex sphere visuals with zoom handle locations
        if (_zoomHandles.Count > 0)
            outerShell.UpdateHandles(_zoomHandles.Select(handle => handle.Owner.transform.position).ToArray());
        else
            outerShell.SetPanelRadius(outerShell.radius);

        if (handleCount >= 2)
            Expand();
    }

    public void StopZoom()
    {
        IsZooming = false;
    }

    private void CheckZoomHandles()
    {
        for (int i = _zoomHandles.Count - 1; i >= 0; i--)
        {
            try
            {
                bool active = ZoomHandles[i].Owner.activeSelf;
            }
            catch (MissingReferenceException e)
            {
                _zoomHandles.RemoveAt(i);
            }
        }
    }

    public void ClearZoomHandles()
    {
        foreach (ZoomHandle handle in _zoomHandles)
            handle.EndGrab();
        _zoomHandles.Clear();
    }


    /*
     * Compressors - Used for moving down a shell level
     */
    public enum HandleSide { LEFT = 0, RIGHT };
    public ButtonBase[] compressorButtons;
    public ButtonBase GetCompressorButton(HandleSide side) { return compressorButtons[(int)side]; }
    bool BothCompressorsTouched { get { return (compressorButtons[0].GetFraction() > 0.0f && compressorButtons[1].GetFraction() > 0.0f); } }
    bool BothCompressorsHeld { get { return (compressorButtons[0].GetFraction() >= 1.0f && compressorButtons[1].GetFraction() >= 1.0f); } }

    private void SetCompressorButtonActive(bool status)
    {
        foreach (ButtonBase btn in compressorButtons)
            btn.transform.parent.gameObject.SetActive(status);
    }

    private void CheckCompressionTriggers()
    {
        if (BothCompressorsHeld)
        {
            Collapse();
        }
        else if (BothCompressorsTouched)
        {
            //Wait for one hand to be released
        }
        else
        {
            if (GetCompressorButton(HandleSide.LEFT).GetFraction() >= 1.0f)
                Swipe(HandleSide.LEFT);
            else if (GetCompressorButton(HandleSide.RIGHT).GetFraction() >= 1.0f)
                Swipe(HandleSide.RIGHT);
        }
    }

    private bool CheckHandsInCompressors()
    {
        for (HandleSide side = 0; (int)side < 2; side++)
        {
            Collider[] colliders = Physics.OverlapSphere(GetCompressorButton(side).transform.position, 0.125f, 1 << 9);
            if(colliders.Length > 0)
                return true;
        }
        return false;
    }




    /*
     * Unity
     */
    void Start()
    {
        _zoomHandles = new List<IGrabbable>();
        _isInteractable = true;
        Collapse();
        ZoomState = ZoomStates.MINIMIZED;
    }

    void Update()
    {

        //Zoom animation states
        //switch (ZoomState)
        //{
        //    case ZoomStates.MINIMIZED:
        //        break;
        //    case ZoomStates.MIN_TO_MAX:
        //        if(IsInteracting)
        //            UpdateZoom();
        //        break;
        //    case ZoomStates.MAXIMIZED:
        //        break;
        //    case ZoomStates.MAX_TO_MIN:
        //        UpdateZoom();
        //        break;
        //}


        //Active shell level states
        switch (ShellState)
        {
            case ShellStates.COLLAPSED:
                if (IsInteracting)
                {
                    UpdateGrab();
                    UpdateZoom();
                }
                break;
            case ShellStates.COLLAPSED_EXPANDING:
                //If we're arriving from a collapsed state, ignore compressor actions
                if (CheckHandsInCompressors())
                {
                    GetCompressorButton(HandleSide.LEFT).Interactable = false;
                    GetCompressorButton(HandleSide.RIGHT).Interactable = false;
                }
                else
                {
                    GetCompressorButton(HandleSide.LEFT).Interactable = true;
                    GetCompressorButton(HandleSide.RIGHT).Interactable = true;
                    _shellState = ShellStates.INTERACTABLE;
                }
                break;
            case ShellStates.INTERACTABLE_COLLAPSING:
                break;
            case ShellStates.INTERACTABLE:
                CheckCompressionTriggers();
                break;
            case ShellStates.INTERACTABLE_EXPANDING:
                break;
            case ShellStates.DISTANT_COLLAPSING:
                break;
            case ShellStates.DISTANT:
                break;
        }
    }

    public void OnDrawGizmos()
    {
        if (_shellState == ShellStates.COLLAPSED_EXPANDING && CheckHandsInCompressors())
        {
            Gizmos.DrawWireSphere(GetCompressorButton(HandleSide.LEFT).transform.position, 0.125f);
            Gizmos.DrawWireSphere(GetCompressorButton(HandleSide.RIGHT).transform.position, 0.125f);
        }
    }
}
