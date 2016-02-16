using UnityEngine;
using System.Collections;
using HandPoses;

public class BoneFollower : MonoBehaviour {
    public HandPoseRBF hand;
    public int finger;
    public int bone;
    public bool palm;

	// Use this for initialization
	void Start () {
        GetComponent<Renderer>().material.SetColor("_Color", Color.red);
	}

    public void UpdateTracker()
    {
        if (hand.handModel != null)
        {
            if (palm)
            {
                transform.position = hand.handModel.GetPalmPosition();
                transform.rotation = hand.handModel.GetPalmRotation();
            }
            else
            {
                transform.position = hand.handModel.fingers[finger].GetBoneCenter(bone);
            }
        }
    }
}
