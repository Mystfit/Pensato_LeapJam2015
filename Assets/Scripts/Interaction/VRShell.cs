using UnityEngine;
using System.Collections;
using LeapInteractions;
using System;
using LMWidgets;

public class VRShell : MonoBehaviour, IZoomable, IGrabbable
{
    /*
    *  Shell 
    */
    public enum ShellStates { COLLAPSED = 0, INTERACTABLE, LARGE };
    private ShellStates _shellStatus;
    public ShellStates ShellState {
        get { return _shellStatus; }
        set {
            Debug.Log("Shell status changing to: " + Enum.GetName(typeof(ShellStates), value));
            _shellStatus = value;
            if (onShellStateChanged != null) onShellStateChanged(_shellStatus);
        }
    }
    public delegate void ShellStateChanged(ShellStates state);
    public event ShellStateChanged onShellStateChanged;

    public float minimizedShellScale = 0.06f;
    public float interactableShellScale = 0.3f;
    public float largeShellScale = 2.0f;

    /*
    *  Grabbing
    */
    private bool _isGrabbed;
    public bool IsGrabbed { get { return _isGrabbed; } }

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
    private ZoomStatus _zoomstatus;
    public ZoomStatus Zoom { get { return _zoomstatus; } set { _zoomstatus = value; } }
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
     * Compressors - Used for collapsing the shell down a level / moving to another shell on the same level
     */
    public ButtonBase leftCompressorBtn;
    public ButtonBase rightCompressorBtn;
    
    public enum CompressorBtnSide { LEFT = 0, RIGHT };
    public ButtonBase GetCompressorButton(CompressorBtnSide side) { return (side == CompressorBtnSide.LEFT) ? leftCompressorBtn : rightCompressorBtn; }
    protected enum CompressorHeldStatus { NONE = 0, SINGLE, BOTH };
    protected CompressorHeldStatus _compressorHeldStatus;

    public event ZoomStatusChanged onZoomStatusChanged;
    public event GrabStatusChanged onGrabStatusChanged;

    private void compressorButtonPressed(object sender, EventArg<bool> e)
    {
        //Compressor buttons only useable when shell is interactable
        if (ShellState == ShellStates.INTERACTABLE)
        {
            ButtonBase btn = (ButtonBase)sender;
            if (BothCompressorsHeld)
            {
                //Collapse shell down a level
                Debug.Log("Collapsing shell");
                ShellState = ShellStates.COLLAPSED;
            }
            else if(BothCompressorsTouched)
            {
                //Wait for other hand to leave compressor
                Debug.Log("Waiting for full compression");
            }
            else
            {
                //Swipe to next shell in this subshell
                Debug.Log("Swiping shell");
            }
        }
    }

    private void compressorButtonReleased(object sender, EventArg<bool> e)
    {
    }

    bool BothCompressorsTouched { get { return (leftCompressorBtn.GetFraction() > 0.0f && rightCompressorBtn.GetFraction() > 0.0f); } }
    bool BothCompressorsHeld { get { return (leftCompressorBtn.GetFraction() >= 1.0f && rightCompressorBtn.GetFraction() >= 1.0f); } }

    public GrabStatus Grab
    {
        get
        {
            throw new NotImplementedException();
        }

        set
        {
            throw new NotImplementedException();
        }
    }


    /*
     * Unity
     */
    void Start()
    {
        ShellState = ShellStates.INTERACTABLE;

        leftCompressorBtn.StartHandler += compressorButtonPressed;
        rightCompressorBtn.StartHandler += compressorButtonPressed;
        leftCompressorBtn.EndHandler += compressorButtonReleased;
        rightCompressorBtn.EndHandler += compressorButtonReleased;
    }

    void Update () {

        //Zoom animation states
        switch (Zoom)
        {
            case ZoomStatus.MINIMIZED:
                break;
            case ZoomStatus.MIN_TO_MAX:
                break;
            case ZoomStatus.MAXIMIZED:
                break;
            case ZoomStatus.MAX_TO_MIN:
                break;
        }

        //Active shell level states
        switch (ShellState)
        {
            case ShellStates.COLLAPSED:
                break;
            case ShellStates.INTERACTABLE:
                break;
            case ShellStates.LARGE:
                break;
        }
	}
}
