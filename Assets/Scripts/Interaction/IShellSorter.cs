using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace ShellUI
{
    public delegate void SortGroupCreatedEvent(ShellGroup group);
    public delegate void SortGroupContentUpdatedEvent(ShellGroup group);

    public interface IShellSorter {
        IEnumerable<ShellGroup> ShellGroups { get; }
        event SortGroupCreatedEvent onShellGroupCreated;
        event SortGroupContentUpdatedEvent onShellGroupContentUpdated;
        bool Add(VRShell shell);
        bool Remove(VRShell shell);
    }
}