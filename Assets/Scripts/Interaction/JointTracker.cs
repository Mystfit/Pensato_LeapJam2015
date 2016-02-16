using UnityEngine;
using System.Collections;

public class JointTracker : MonoBehaviour {

    private BoneFollower[,] _boneFollowers;
    private BoneFollower _palm;

	void Start () {
        _boneFollowers = new BoneFollower[5,4];
        for (int i = 0; i < transform.childCount; i++)
        {
            BoneFollower b = transform.GetChild(i).GetComponent<BoneFollower>();
            if (b.palm)
                _palm = b;
            else
                _boneFollowers[b.finger, b.bone] = b;
        }
	}
	
	void Update () {
        if (_palm != null)
            _palm.UpdateTracker();
	    for(int finger = 0; finger < 5; finger++)
        {
            for(int bone = 0; bone < 4; bone++)
                _boneFollowers[finger, bone].UpdateTracker();
        }
	}

    public Transform GetPalm()
    {
        return _palm.transform;
    }

    public Vector3 GetBonePosition(int finger, int bone)
    {
        return _boneFollowers[finger, bone].transform.position;
    }
}
