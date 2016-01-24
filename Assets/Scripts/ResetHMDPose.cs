using UnityEngine;
using System.Collections;

public class ResetHMDPose : MonoBehaviour {
	void Update () {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            UnityEngine.VR.InputTracking.Recenter();
        }
	}
}
