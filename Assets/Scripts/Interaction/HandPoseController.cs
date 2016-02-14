using UnityEngine;
using UnityEngine.UI;
using System;
using System.Collections;
using System.Collections.Generic;
using HandPoses;

public class HandPoseController : MonoBehaviour
{
    // References
    private HandController leapController;
    public HandPoseRBF lefthandRBF;
    public HandPoseRBF righthandRBF;

    void Start()
    {
        leapController = GetComponent<HandController>();
        leapController.onCreateHand += HandCreated;
        leapController.onDestroyHand += HandDestroyed;
    }

    private void HandCreated(HandModel hand)
    {
        if (hand.GetLeapHand().IsLeft)
            lefthandRBF.handModel = hand;
        else
            righthandRBF.handModel = hand;
    }

    private void HandDestroyed(HandModel hand)
    {
        if (hand.GetLeapHand().IsLeft)
            lefthandRBF.handModel = null;
        else
            righthandRBF.handModel = null;
    }
}
