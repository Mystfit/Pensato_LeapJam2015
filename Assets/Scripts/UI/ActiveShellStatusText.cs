using UnityEngine;
using UnityEngine.UI;
using System;
using System.Collections;

public class ActiveShellStatusText : MonoBehaviour {

    public VRShell shell;
    private Text _statusText;

	void Start () {
        _statusText = GetComponent<Text>();
        shell.onShellStateChanged += Shell_onShellStateChanged;
    }

    private void Shell_onShellStateChanged(VRShell.ShellStates status)
    {
        _statusText.text = Enum.GetName(typeof(VRShell.ShellStates), status);
    }
}
