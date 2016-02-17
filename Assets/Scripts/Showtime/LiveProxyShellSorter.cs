using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ShellUI;
using UnityEngine;

public class LiveProxyShellSorter : MonoBehaviour, IShellSorter
{
    public GameObject shellGroupPrefab;
    private Transform _groupParent;

    private Dictionary<Type, ShellGroup> _shellGroups = new Dictionary<Type, ShellGroup>();
    public IEnumerable<ShellGroup> ShellGroups { get { return _shellGroups.Values; } }

    public event SortGroupContentUpdatedEvent onShellGroupContentUpdated;
    public event SortGroupCreatedEvent onShellGroupCreated;

    void Start()
    {
        _groupParent = new GameObject("group_parent").transform;
        _groupParent.position = Vector3.zero;
    }

    public bool Add(VRShell shell)
    {
        LiveProxy proxy = shell.GetComponent<LiveProxy>();
        if (proxy == null)
            return false;

        ShellGroup shellGroup = null;
        if (!_shellGroups.ContainsKey(shell.GetType()))
        {
            //Create shell group
            shellGroup = GameObject.Instantiate(shellGroupPrefab).GetComponent<ShellGroup>();
            _shellGroups.Add(shell.GetType(), shellGroup);

            shellGroup.transform.SetParent(_groupParent, false);

            if (onShellGroupCreated != null)
                onShellGroupCreated(shellGroup);
        }
        else
        {
            shellGroup = _shellGroups[shell.GetType()];
        }

        //Add shell to end of group
        shellGroup.Shells.AddLast(shell);
        shellGroup.AttachShell(shell);

        if (onShellGroupContentUpdated != null)
            onShellGroupContentUpdated(shellGroup);
        return true;
    }

    public bool Remove(VRShell shell)
    {
        LiveProxy proxy = shell.GetComponent<LiveProxy>();
        if (proxy == null)
            return false;

        return _shellGroups[proxy.GetType()].Shells.Remove(shell);
    }
}




