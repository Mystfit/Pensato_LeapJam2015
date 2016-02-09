using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class HandPoseController : MonoBehaviour
{
    public HandPoseRBF lefthandRBF;
    public HandPoseRBF righthandRBF;
    public bool m_leftHandActive = true;
    public bool m_rightHandActive = true;

    // Use this for initialization
    void Start()
    {
        HandController handCtl = GetComponent<HandController>();
        handCtl.onCreateHand += HandCreated;
        handCtl.onDestroyHand += HandDestroyed;
    }

    void HandCreated(HandModel hand)
    {
        if (hand.GetLeapHand().IsLeft)
            lefthandRBF.handModel = hand;
        else
            righthandRBF.handModel = hand;
    }

    void HandDestroyed(HandModel hand)
    {
        if (hand.GetLeapHand().IsLeft)
            lefthandRBF.handModel = null;
        else
            righthandRBF.handModel = null;
    }
}
