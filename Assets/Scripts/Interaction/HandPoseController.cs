using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class HandPoseController : MonoBehaviour
{
    public HandPoseRBF m_leftGlove;
    public HandPoseRBF m_rightGlove;
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
            m_leftGlove.handModel = hand;
        else
            m_rightGlove.handModel = hand;
    }

    void HandDestroyed(HandModel hand)
    {
        if (hand.GetLeapHand().IsLeft)
            m_leftGlove.handModel = null;
        else
            m_rightGlove.handModel = null;
    }
}
