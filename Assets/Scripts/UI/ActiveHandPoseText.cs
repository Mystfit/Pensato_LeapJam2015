using UnityEngine;
using UnityEngine.UI;
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
        if(hand.isTrained)
            poseText.text = hand.activeGesture;
    }
}
