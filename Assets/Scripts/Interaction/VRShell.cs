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
    public float expansionTrigger = 0.1f;
    public float compressionTrigger = 0.05f;

    //Shell states
    public enum ShellStates { COLLAPSED = 0, INTERACTABLE, LARGE };
    private ShellStates _shellStatus;
    public ShellStates ShellState {
        get { return _shellStatus; }
        set {
            _shellStatus = value;
            if (onShellStateChanged != null) onShellStateChanged(_shellStatus);
        }
    }
    public delegate void ShellStateChanged(ShellStates state);
    public event ShellStateChanged onShellStateChanged;

    public enum ShellTransitions { COLLAPSING = 0, IDLE, EXPANDING };
    private ShellTransitions _shellTransition;
    public ShellTransitions ShellTransition {
        get { return _shellTransition; }
        set { _shellTransition = value; }
    }

    //Shell hierarchy
    private VRShell _parentShell;
    public VRShell parent { get { return _parentShell; } }
    public void SetParentShell(VRShell parent) { _parentShell = parent; }

    private HashSet<VRShell> _childShells;
    public HashSet<VRShell> children { get { return _childShells; } }
    public void AddChildShell(VRShell shell) {
        _childShells.Add(shell);
        shell.SetParentShell(this);
    }
    public void RemoveChildShell(VRShell shell) {
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
    private bool _isGrabbed;
    public bool IsGrabbed { get { return _isGrabbed; } }
    private GrabStates _grabStatus;
    public GrabStates GrabState {
        get { return _grabStatus; }
        set {
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



    /*
    *  Zoom
    */
    private bool _isZoomable;
    public bool IsZoomable { get { return _isZoomable; } }
    private ZoomStates _zoomstatus;
    public ZoomStates ZoomState { get { return _zoomstatus; } set { _zoomstatus = value; } }
    public event ZoomStatusChanged onZoomStatusChanged;

    public void StartZoom()
    {
        throw new NotImplementedException();
    }

    public void UpdateZoom()
    {
        throw new NotImplementedException();
    }

    public void StopZoom()
    {
        throw new NotImplementedException();
    }

    private Transform _attachpoints;
    public void AddAttachPoint(Transform attachpoint)
    {
        throw new NotImplementedException();
    }

    public void RemoveAttachPoint(Transform attachpoint)
    {
        throw new NotImplementedException();
    }


    /*
     * Compressors/Expanders - Used for moving between shell levels
     */
    public enum HandleSide { LEFT = 0, RIGHT };
    public ButtonBase leftCompressorBtn;
    public ButtonBase rightCompressorBtn;    
    public ButtonBase GetCompressorButton(HandleSide side) { return (side == HandleSide.LEFT) ? leftCompressorBtn : rightCompressorBtn; }

    public ExpansionHandle leftExpanderHandle;
    public ExpansionHandle rightExpanderHandle;
    public ExpansionHandle GetExpansionHandle(HandleSide side) { return (side == HandleSide.LEFT) ? leftExpanderHandle : rightExpanderHandle; }

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
            if (GetCompressorButton(HandleSide.LEFT).GetFraction() > GetCompressorButton(HandleSide.RIGHT).GetFraction())
                Swipe(HandleSide.LEFT);
            else
                Swipe(HandleSide.RIGHT);
        }
    }

    private void CheckExpansionTriggers()
    {
        if (Vector3.Distance(leftExpanderHandle.transform.position, transform.position) > expansionTrigger &&
                   Vector3.Distance(rightExpanderHandle.transform.position, transform.position) > expansionTrigger)
        {
            Expand();
        }
    }

    bool BothCompressorsTouched { get { return (leftCompressorBtn.GetFraction() > 0.0f && rightCompressorBtn.GetFraction() > 0.0f); } }
    bool BothCompressorsHeld { get { return (leftCompressorBtn.GetFraction() >= 1.0f && rightCompressorBtn.GetFraction() >= 1.0f); } }

    

    /*
     * Unity
     */
    void Start()
    {
        Collapse();
    }

    void Update () {

        //Zoom animation states
        switch (ZoomState)
        {
            case ZoomStates.MINIMIZED:
                break;
            case ZoomStates.MIN_TO_MAX:
                break;
            case ZoomStates.MAXIMIZED:
                break;
            case ZoomStates.MAX_TO_MIN:
                break;
        }

        //Active shell level states
        switch (ShellState)
        {
            case ShellStates.COLLAPSED:
                CheckExpansionTriggers();
                break;
            case ShellStates.INTERACTABLE:
                CheckCompressionTriggers();
                break;
            case ShellStates.LARGE:
                break;
        }
	}
}
