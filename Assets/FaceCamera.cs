using UnityEngine;
using System.Collections;

public class FaceCamera : MonoBehaviour {

    public Transform faceTarget;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	    if(faceTarget != null)
        {
            Quaternion faceAngle = Quaternion.LookRotation(faceTarget.position - transform.position);
            faceAngle.eulerAngles = new Vector3(0.0f, faceAngle.eulerAngles.y + 180.0f, 0.0f);
            transform.rotation = faceAngle;
        }
	}
}
