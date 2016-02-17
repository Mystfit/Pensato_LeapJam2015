using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

namespace ShellUI
{
    public class ShellGroup : MonoBehaviour
    {
        public Transform shellRoot;
        private LinkedList<VRShell> _shells = new LinkedList<VRShell>();
        public LinkedList<VRShell> Shells { get { return _shells; } }

        public void AttachShell(VRShell shell)
        {
            shell.transform.SetParent(shellRoot, false);
        }
    }
}

