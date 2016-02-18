using UnityEngine;
using System.Collections;
using ShellUI;

public class ShellTestSpawner : MonoBehaviour {

    public GameObject shellPrefab;

    public int numRootShells = 1;
    public int numChildShells = 3;

	void Start () {
        VRShell shell = GameObject.Instantiate(shellPrefab).GetComponent<VRShell>();
        shell.transform.SetParent(transform, false);
        for(int i = 0; i < numChildShells; i++)
        {
            VRShell childShell = GameObject.Instantiate(shellPrefab).GetComponent<VRShell>();
            shell.AddChildShell(childShell);
        }
	}
}
