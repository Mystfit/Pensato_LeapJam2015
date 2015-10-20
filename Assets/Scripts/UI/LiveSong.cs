using UnityEngine;
using Utils;
using System.Collections;

public class LiveSong : LiveProxy {

    //ASSUME: Have track holder
    private Transform trackParent;

    void Awake () {
        trackParent = gameObject.FindInChildren("tracks").transform;
    }
}
