using UnityEngine;
using UnityEngine.UI;
using HandPoses;
using System;
using System.Collections;

public class ActiveHandPoseText : MonoBehaviour {
    private Text poseText;
    public HandPoseRBF hand;

	// Use this for initialization
	void Start () {
        poseText = GetComponent<Text>();
        hand.onPoseChanged += Hand_onPoseChanged;
    }

    private void Hand_onPoseChanged(HandPoseRBF.PoseType pose)
    {
        if (hand.activePose == HandPoseRBF.PoseType.UNRECOGNIZED)
            poseText.color = Color.grey;
        else
            poseText.color = Color.white;
        poseText.text = string.Format("{0}:{1}", hand.activePose, hand.poseConfidence);
    }
}
