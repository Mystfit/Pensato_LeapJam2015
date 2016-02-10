using UnityEngine;
using UnityEngine.UI;
using HandPoses;
using System.Collections;

public class ActiveHandPoseText : MonoBehaviour {
    private Text poseText;
    public HandPoseRBF hand;

	// Use this for initialization
	void Start () {
        poseText = GetComponent<Text>();
    }
	
	// Update is called once per frame
	void Update () {
        if (hand.isTrained)
        {
            if (hand.activePose == HandPoseRBF.PoseType.UNRECOGNIZED)
                poseText.color = Color.grey;
            else
                poseText.color = Color.white;
            poseText.text = string.Format("{0}:{1}", hand.activePose, hand.poseConfidence);
        }
    }
}
