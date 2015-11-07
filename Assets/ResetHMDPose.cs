using UnityEngine;
using System.Collections;

public class ResetHMDPose : MonoBehaviour {
	void Update () {
        if (Input.GetKeyDown(KeyCode.R))
        {
            UnityEngine.VR.InputTracking.Recenter();
        }
	}
}
