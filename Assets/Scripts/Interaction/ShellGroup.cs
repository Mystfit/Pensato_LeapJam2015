using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

namespace ShellUI
{
    public class ShellGroup : MonoBehaviour
    {
        public RectTransform shellRoot;
        public float spacing;

        private LinkedList<VRShell> _shells;
        public LinkedList<VRShell> Shells
        {
            get
            {
                if (_shells == null)
                    _shells = new LinkedList<VRShell>();
                return _shells;
            }
        }

        public void AttachShell(VRShell shell)
        {
            shell.transform.SetParent(shellRoot, false);

        }

        void Update()
        {
            if (_queuedArrange)
            {
                Arrange();
                _queuedArrange = false;
            }
        }

        private bool _queuedArrange;
        public void QueueArrange()
        {
            _queuedArrange = true;
        }


        public void Arrange()
        {
            int i = 0;
            foreach(VRShell shell in _shells)
            {
                shell.transform.localPosition = new Vector3(0.0f, i++ * -spacing, 0.0f);
            }
            shellRoot.sizeDelta = new Vector2(0.0f, _shells.Count * spacing * 2.0f);
            Debug.Log(shellRoot.sizeDelta.y);
        }
    }
}

