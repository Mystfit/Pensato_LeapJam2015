using UnityEngine;
using UnityEngine.UI;
using System;
using System.Collections;
using System.Collections.Generic;
using HandPoses;

public class HandModelTracker : MonoBehaviour
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
        {
            Debug.Log("LEFT hand created");

            lefthandRBF.handModel = hand;
        }
        else
        {
            righthandRBF.handModel = hand;
            Debug.Log("RIGHT hand created");
        }
    }

    private void HandDestroyed(HandModel hand)
    {
        if (hand.GetLeapHand().IsLeft)
        {
            Debug.Log("LEFT hand destroyed");
            lefthandRBF.handModel = null;
        }

        else
        {
            Debug.Log("RIGHT hand destroyed");
            righthandRBF.handModel = null;
        }
    }
}
