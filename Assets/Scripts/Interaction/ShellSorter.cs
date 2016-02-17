using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ShellUI;
using UnityEngine;

public class ShellSorter : MonoBehaviour, IShellSorter
{
    public GameObject shellGroupPrefab;

    private Dictionary<Type, ShellGroup> _shellGroups = new Dictionary<Type, ShellGroup>();
    public IEnumerable<ShellGroup> ShellGroups { get { return _shellGroups.Values; } }

    public event SortGroupContentUpdatedEvent onShellGroupContentUpdated;
    public event SortGroupCreatedEvent onShellGroupCreated;

    public bool Add(VRShell shell)
    {
        ShellGroup shellGroup = null;
        if (!_shellGroups.ContainsKey(shell.GetType()))
        {
            //Create shell group
            shellGroup = GameObject.Instantiate(shellGroupPrefab).GetComponent<ShellGroup>();
            _shellGroups.Add(shell.GetType(), shellGroup);

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
        return _shellGroups[shell.GetType()].Shells.Remove(shell);
    }
}
