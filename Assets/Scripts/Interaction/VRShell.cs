using UnityEngine;
using System.Collections;
using LeapInteractions;
using System;
using LMWidgets;

public class VRShell : MonoBehaviour, IZoomable, IGrabbable
{
    /*
    *  Grabbing
    */
    private bool _isHovered;
    public bool IsHovered { get { return false; } }
    public void OnStartHover() { }
    public void OnStopHover() { }
   
    private bool _isGrabbed;
    public bool IsGrabbed { get { return _isGrabbed; } }
    public void OnGrab() { }
    public void OnRelease() { }

    /*
    *  Shell 
    */
    public enum ShellStates { COLLAPSED = 0, INTERACTABLE, LARGE };
    private ShellStates _shellStatus;
    public ShellStates ShellState { get { return _shellStatus; } set { _shellStatus = value; } }

    /*
    *  Zoom
    */
    private bool _isZoomable;
    public bool IsZoomable { get { return _isZoomable; } }
    private ZoomStatus _zoomstatus;
    public ZoomStatus Zoom { get { return _zoomstatus; } set { _zoomstatus = value; } }
    public void OnStartZoom(){ }
    public void ContinueZoom(Vector3 firstAttachPoint, Vector3 secondAttachPoint){ }
    public void OnStopZoom(){ }
    public bool IsCloneable { get { return false; } }

    //Compressor buttons - Used for collapsing the shell down a level / moving to another shell on the same level
    public ButtonBase leftCompressorBtn;
    public ButtonBase rightCompressorBtn;
    
    public enum CompressorBtnSide { LEFT = 0, RIGHT };
    public ButtonBase GetCompressorButton(CompressorBtnSide side) { return (side == CompressorBtnSide.LEFT) ? leftCompressorBtn : rightCompressorBtn; }
    protected enum CompressorHeldStatus { NONE = 0, SINGLE, BOTH };
    protected CompressorHeldStatus _compressorHeldStatus;
    protected ButtonBase _heldCompressor;


    void Start () {
        leftCompressorBtn.StartHandler += compressorButtonPressed;
        rightCompressorBtn.StartHandler += compressorButtonPressed;
        leftCompressorBtn.EndHandler += compressorButtonReleased;
        rightCompressorBtn.EndHandler += compressorButtonReleased;
    }

    private void compressorButtonPressed(object sender, EventArg<bool> e)
    {
        //Compressor buttons only useable when shell is interactable
        if (ShellState == ShellStates.INTERACTABLE)
        {
            ButtonBase btn = (ButtonBase)sender;
            if (_heldCompressor == null)
            {
                _heldCompressor = btn;
                _heldCompressor = null;
            }
            else
            {
                //Collapse shell down a level
            }
        }
    }

    private void compressorButtonReleased(object sender, EventArg<bool> e)
    {
        _heldCompressor = null;
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

    bool BothCompressorsTouched { get { return (leftCompressorBtn.GetFraction() > 0.0f && rightCompressorBtn.GetFraction() > 0.0f); } }
    bool BothCompressorsHeld { get { return (leftCompressorBtn.GetFraction() >= 1.0f && rightCompressorBtn.GetFraction() >= 1.0f); } }
}
