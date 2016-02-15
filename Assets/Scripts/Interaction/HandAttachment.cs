using UnityEngine;
using System.Collections;
using HandPoses;
using LeapInteractions;

public class HandAttachment : MonoBehaviour
{

    HandPoseRBF handRBF;
    HandPoseRBF.PoseCategory _lastPose = HandPoseRBF.PoseCategory.NEUTRAL;

    // Layers that we can grab.
    public LayerMask grabbableLayers = ~0;

    // Maximum distance of an object that we can grab when pinching.
    public float grabObjectDistance = 0.05f;
    public float pinchObjectDistance = 0.07f;

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
    protected T FindClosestInteractableObject<T>(Vector3 grabPosition, float grabSize)
    {
        T closestInteractable = default(T);
        Collider closestCollider = null;
        float closest_sqr_distance = grabSize * grabSize;
        Collider[] close_things = Physics.OverlapSphere(grabPosition, grabSize, grabbableLayers);

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

        if (closestCollider != null)
            closestInteractable = closestCollider.GetComponent<T>();

        return closestInteractable;
    }




    private void HandRBF_onPoseCategoryChanged(HandPoseRBF.PoseCategory pose)
    {
        switch (pose)
        {
            case HandPoseRBF.PoseCategory.NEUTRAL:
                if (_attachedGrabbable != null)
                {
                    //Release grabbed object
                    try
                    {
                        _attachedGrabbable.EndGrab();
                        _attachedGrabbable = null;
                    }
                    catch (MissingReferenceException e)
                    {
                        Debug.LogWarning("Grabbed object missing! Can't remove.");
                    }
                    DestroyGrabPoint();
                }
                _lastPose = pose;
                break;
            case HandPoseRBF.PoseCategory.GRASP:
                if (_lastPose == HandPoseRBF.PoseCategory.NEUTRAL)
                {
                    UpdateGrabPoint();
                    IGrabbable closestGrabbable = (IGrabbable)FindClosestInteractableObject<IGrabbable>(_grabPoint.transform.position, grabObjectDistance);
                    if (closestGrabbable != null)
                    {
                        _attachedGrabbable = closestGrabbable;
                        _attachedGrabbable.StartGrab(_grabPoint.transform);

                        Debug.Log(string.Format("{0} grabbing {1}", handRBF.hand, _attachedGrabbable));
                    }
                    _lastPose = pose;
                }
                break;
            case HandPoseRBF.PoseCategory.PINCH:
                if (_lastPose == HandPoseRBF.PoseCategory.NEUTRAL)
                {
                    UpdateGrabPoint();
                    IZoomable closestZoomable = FindClosestInteractableObject<IZoomable>(_grabPoint.transform.position, pinchObjectDistance);
                    if (closestZoomable != null)
                    {
                        IGrabbable handle = closestZoomable.CreateZoomHandle();
                        _attachedGrabbable = handle;
                        _attachedGrabbable.StartGrab(_grabPoint.transform);
                        Debug.Log(string.Format("{0} zooming handle {1}", handRBF.hand, _attachedGrabbable));
                    }
                    _lastPose = pose;
                }
                break;
        }
    }

    private void UpdateGrabPoint()
    {
        if (_grabPoint == null && handRBF.handModel != null)
        {
            _grabPoint = new GameObject("grabpoint");
            _grabPoint.transform.localPosition = Vector3.zero;
            _grabPoint.transform.rotation *= handRBF.handModel.GetPalmRotation();
        }

        if (handRBF.handModel != null)
        {
            Vector3 total = Vector3.zero;
            if (HandPoseRBF.GetPoseCategory(handRBF.activePose) == HandPoseRBF.PoseCategory.GRASP)
            {
                for (int i = 0; i < 5; i++)
                    total += handRBF.handModel.fingers[i].GetTipPosition();
                _grabPoint.transform.position = Vector3.Lerp(total / 5, handRBF.handModel.GetPalmPosition(), 0.5f);
            }
            else if (HandPoseRBF.GetPoseCategory(handRBF.activePose) == HandPoseRBF.PoseCategory.PINCH)
            {
                FingerModel finger = null;
                if (handRBF.activePose == HandPoseRBF.PoseType.PINCH_INDEX)
                    finger = handRBF.handModel.fingers[1];
                else if (handRBF.activePose == HandPoseRBF.PoseType.PINCH_MID)
                    finger = handRBF.handModel.fingers[2];
                else if (handRBF.activePose == HandPoseRBF.PoseType.PINCH_RING)
                    finger = handRBF.handModel.fingers[3];
                else if (handRBF.activePose == HandPoseRBF.PoseType.PINCH_PINKY)
                    finger = handRBF.handModel.fingers[4];

                _grabPoint.transform.position = Vector3.Lerp(finger.GetTipPosition(), handRBF.handModel.fingers[0].GetTipPosition(), 0.5f);
            }
        }
    }


    void OnDrawGizmos()
    {
        if (_attachedGrabbable != null)
            Gizmos.color = Color.red;
        else
            Gizmos.color = Color.white;

        if (_grabPoint != null)
        {
            if (_lastPose == HandPoseRBF.PoseCategory.GRASP)
                Gizmos.DrawWireSphere(_grabPoint.transform.position, grabObjectDistance);
            else if (_lastPose == HandPoseRBF.PoseCategory.PINCH)
                Gizmos.DrawWireSphere(_grabPoint.transform.position, pinchObjectDistance);
        }
    }

    void DestroyGrabPoint()
    {
        if (_grabPoint != null)
        {
            Destroy(_grabPoint);
            _grabPoint = null;
        }
    }

    void Update()
    {
        if (_grabPoint != null)
        {
            if (handRBF.handModel == null ||
               _lastPose == HandPoseRBF.PoseCategory.NEUTRAL ||
               _lastPose == HandPoseRBF.PoseCategory.UNRECOGNIZED
               )
                DestroyGrabPoint();
            else
                UpdateGrabPoint();
        }
    }
}
