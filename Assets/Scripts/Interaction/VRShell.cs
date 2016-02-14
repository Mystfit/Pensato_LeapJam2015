using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using LeapInteractions;
using System;
using LMWidgets;

public class VRShell : MonoBehaviour, IZoomable, IGrabbable
{
    /*
    *  Shell 
    */
    public GameObject collapsedShell;
    public GameObject interactableShell;
    public GameObject largeShell;

    //Shell sizes
    public float minimizedShellScale = 0.06f;
    public float interactableShellScale = 0.37f;
    public float largeShellScale = 2.0f;
    public float zoomThreshold = 0.1f;
    public float compressionTrigger = 0.05f;

    //Shell states
    public enum ShellStates { COLLAPSED = 0, INTERACTABLE, LARGE };
    private ShellStates _shellStatus;
    public ShellStates ShellState
    {
        get { return _shellStatus; }
        set
        {
            _shellStatus = value;
            if (onShellStateChanged != null) onShellStateChanged(_shellStatus);
        }
    }
    public delegate void ShellStateChanged(ShellStates state);
    public event ShellStateChanged onShellStateChanged;

    public enum ShellTransitions { COLLAPSING = 0, IDLE, EXPANDING };
    private ShellTransitions _shellTransition;
    public ShellTransitions ShellTransition
    {
        get { return _shellTransition; }
        set { _shellTransition = value; }
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
        ShellState = ShellStates.INTERACTABLE;
        largeShell.SetActive(false);
        interactableShell.SetActive(true);
        collapsedShell.SetActive(false);
    }

    public void Collapse()
    {
        ShellState = ShellStates.COLLAPSED;
        largeShell.SetActive(false);
        interactableShell.SetActive(false);
        collapsedShell.SetActive(true);
    }

    public void Swipe(HandleSide fromSide)
    {
        Collapse();
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
        _grabPoint = grabPoint;
        _isInteracting = true;
    }


    public void UpdateGrab()
    {
        if (_isInteracting && _grabPoint != null)
        {
            transform.position = _grabPoint.position;
        }
    }

    public void EndGrab()
    {
        _grabPoint = null;
        _isInteracting = false;
    }

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
    public bool IsInteracting { get { return _isInteracting; } }



    /*
    *  Zoom
    */
    public event ZoomStatusChanged onZoomStatusChanged;
    private ZoomStates _zoomstatus;
    public ZoomStates ZoomState { get { return _zoomstatus; } set { _zoomstatus = value; } }
    public bool IsZooming { get { return (_zoomstatus == ZoomStates.MAX_TO_MIN || _zoomstatus == ZoomStates.MIN_TO_MAX); } }

    public GameObject zoomHandlePrefab;
    private List<IGrabbable> _zoomHandles;
    public List<IGrabbable> ZoomHandles { get { return _zoomHandles; } }

    public IGrabbable CreateZoomHandle()
    {
        IGrabbable handle = GameObject.Instantiate(zoomHandlePrefab).GetComponent<IGrabbable>();
        _zoomHandles.Add(handle);
        return handle;
    }
    public void DestroyZoomHandle(IGrabbable handle)
    {
        _zoomHandles.Remove(handle);
    }
   
    public void StartZoom()
    {
        if (IsInteractable)
        {
            _isInteracting = true;
        }
    }

    public void UpdateZoom()
    {
        foreach(ZoomHandle handle in _zoomHandles)
        {
            handle.UpdateGrab();
        }
    }

    public void StopZoom()
    {
        if (IsInteracting)
        {
            _isInteracting = false;
        }
    }

    private void CheckZoomHandles()
    {
        int handleCount = 0;
        for (int i = ZoomHandles.Count - 1; i >= 0; i--)
        {
            try
            {
                if (Vector3.Distance(ZoomHandles[i].WorldPosition, transform.position) > zoomThreshold)
                    handleCount++;
            } catch(MissingReferenceException e)
            {
                ZoomHandles.RemoveAt(i);
            }
        }

        if (handleCount >= 2)
            Expand();
    }


    /*
     * Compressors - Used for moving down a shell level
     */
    public enum HandleSide { LEFT = 0, RIGHT };
    public ButtonBase[] compressorButtons;
    public ButtonBase GetCompressorButton(HandleSide side) { return compressorButtons[(int)side]; }
    bool BothCompressorsTouched { get { return (compressorButtons[0].GetFraction() > 0.0f && compressorButtons[1].GetFraction() > 0.0f); } }
    bool BothCompressorsHeld { get { return (compressorButtons[0].GetFraction() >= 1.0f && compressorButtons[1].GetFraction() >= 1.0f); } }

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
    


    /*
     * Unity
     */
    void Start()
    {
        _zoomHandles = new List<IGrabbable>();
        Collapse();
        ZoomState = ZoomStates.MINIMIZED;
    }

    void Update()
    {

        //Zoom animation states
        switch (ZoomState)
        {
            case ZoomStates.MINIMIZED:
                break;
            case ZoomStates.MIN_TO_MAX:
                if(IsInteracting)
                    UpdateZoom();
                break;
            case ZoomStates.MAXIMIZED:
                break;
            case ZoomStates.MAX_TO_MIN:
                UpdateZoom();
                break;
        }

        //Active shell level states
        switch (ShellState)
        {
            case ShellStates.COLLAPSED:
                if(IsInteracting)
                    UpdateGrab();
                CheckZoomHandles();
                break;
            case ShellStates.INTERACTABLE:
                CheckCompressionTriggers();
                break;
            case ShellStates.LARGE:
                break;
        }
    }
}
