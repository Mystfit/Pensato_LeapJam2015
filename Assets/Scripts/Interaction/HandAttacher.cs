using UnityEngine;
using System.Collections;
using HandPoses;
using LeapInteractions;

public class HandAttacher : MonoBehaviour {

    HandPoseRBF handRBF;
    HandPoseRBF.PoseCategory _lastPose;

    // Layers that we can grab.
    public LayerMask grabbableLayers = ~0;

    // Maximum distance of an object that we can grab when pinching.
    public float grabObjectDistance = 2.0f;

    protected IGrabbable _attachedGrabbable;
    protected GameObject _grabPoint;


    void Start()
    {
        handRBF = GetComponent<HandPoseRBF>();
        handRBF.onPoseCategoryChanged += HandRBF_onPoseCategoryChanged;
    }

    /// <summary>
    /// Finds the closest grabbable object within range of the pinch.
    /// </summary>
    /// <param name="grabPosition">Grabbing position to search from</param>
    /// <returns></returns>
    protected T FindClosestInteractableObject<T>(Vector3 grabPosition)
    {
        T closestInteractable = default(T);
        Collider closestCollider = null;
        float closest_sqr_distance = grabObjectDistance * grabObjectDistance;
        Collider[] close_things = Physics.OverlapSphere(grabPosition, grabObjectDistance, grabbableLayers);

        for (int j = 0; j < close_things.Length; ++j)
        {
            float sqr_distance = (grabPosition - close_things[j].transform.position).sqrMagnitude;

            if (sqr_distance < closest_sqr_distance &&
                !close_things[j].transform.IsChildOf(transform) &&
                close_things[j].tag != "NotGrabbable")
            {
                IInteractable interactable = (IInteractable)close_things[j].GetComponent<T>();
                if (interactable == null || !interactable.IsInteracting)
                {
                    closestCollider = close_things[j];
                    closest_sqr_distance = sqr_distance;
                }
            }
        }

        if(closestCollider != null)
            closestInteractable = closestCollider.GetComponent<T>();
 
        return closestInteractable;
    }




    private void HandRBF_onPoseCategoryChanged(HandPoseRBF.PoseCategory pose)
    {
        UpdateGrabPoint();
        switch (pose)
        {
            case HandPoseRBF.PoseCategory.NEUTRAL:
                if(_attachedGrabbable != null)
                {
                    //Release grabbed object
                    _attachedGrabbable.EndGrab();
                    _attachedGrabbable = null;
                }
                if (_grabPoint)
                {
                    Destroy(_grabPoint);
                    _grabPoint = null;
                }
                break;
            case HandPoseRBF.PoseCategory.GRASP:
                if(_lastPose == HandPoseRBF.PoseCategory.NEUTRAL)
                {
                    IGrabbable closestGrabbable = (IGrabbable)FindClosestInteractableObject<IGrabbable>(_grabPoint.transform.position);
                    if (closestGrabbable != null) {
                        _attachedGrabbable = closestGrabbable;
                        _attachedGrabbable.StartGrab(_grabPoint.transform);
                        
                        Debug.Log(string.Format("{0} grabbing {1}", handRBF.hand, _attachedGrabbable));
                    }
                }

                break;
            case HandPoseRBF.PoseCategory.PINCH:
                if (_lastPose == HandPoseRBF.PoseCategory.NEUTRAL)
                {
                    IZoomable closestZoomable = FindClosestInteractableObject<IZoomable>(_grabPoint.transform.position);
                    if (closestZoomable != null)
                    {
                        IGrabbable handle = closestZoomable.CreateZoomHandle();
                        _attachedGrabbable = handle;
                        _attachedGrabbable.StartGrab(_grabPoint.transform);
                        Debug.Log(string.Format("{0} zooming handle {1}", handRBF.hand, _attachedGrabbable));
                    }
                }
                break;
        }
        _lastPose = pose;
    }

    private void UpdateGrabPoint()
    {
        if(_grabPoint == null)
        {
            _grabPoint = new GameObject("grabpoint");
            _grabPoint.transform.SetParent(handRBF.handModel.gameObject.transform, true);
            _grabPoint.transform.localPosition = Vector3.zero;
        }
        
        if(HandPoseRBF.GetPoseCategory(handRBF.activePose) == HandPoseRBF.PoseCategory.GRASP)
        {
            _grabPoint.transform.position = handRBF.handModel.GetPalmPosition();
        }
        else if(HandPoseRBF.GetPoseCategory(handRBF.activePose) == HandPoseRBF.PoseCategory.PINCH)
        {
            //Pinch position is calculated as lerped between each finger pose position.
            double[] poseStrengths = handRBF.GetRawPose();
            float smallest = 1.0f;
            float largest = 0.0f;
            for (int i = 0; i < poseStrengths.Length; i++)
            {
                largest = Mathf.Max( Utils.MathTools.Clamp((float)poseStrengths[i], 0.0f, 1.0f), largest);
                smallest = Mathf.Min(Utils.MathTools.Clamp((float)poseStrengths[i], 0.0f, 1.0f), smallest);
            }

            Vector3[] pinchPositions = new Vector3[4];
            Vector3 total = new Vector3();
            for (int i = 1; i < 4; i++)
            {
                pinchPositions[i] = Vector3.Lerp(handRBF.handModel.fingers[0].GetTipPosition(), handRBF.handModel.fingers[i].GetTipPosition(), 0.5f);
                total += pinchPositions[i] * Utils.MathTools.Remap((float)poseStrengths[i], smallest, largest, 0.0f, 1.0f);
            }
            _grabPoint.transform.position = total / 4;
        }

        if (_grabPoint != null)
        {
            _grabPoint.transform.rotation *= handRBF.handModel.GetPalmRotation();
            Debug.DrawLine(_grabPoint.transform.position, _grabPoint.transform.position + new Vector3(grabObjectDistance, 0.0f, 0.0f));
            Debug.DrawLine(_grabPoint.transform.position, _grabPoint.transform.position + new Vector3(0.0f, grabObjectDistance, 0.0f));
            Debug.DrawLine(_grabPoint.transform.position, _grabPoint.transform.position + new Vector3(0.0f, 0.0f, grabObjectDistance));
        }
    }

    void Update()
    {
    }
}
