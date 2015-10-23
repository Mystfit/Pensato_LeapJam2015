using UnityEngine;
using System.Linq;
using System.Collections;
using Utils;

namespace Utils
{
    public static class ExtensionMethods
    {
        public static float Map(this float value, float fromSource, float toSource, float fromTarget, float toTarget)
        {
            return (value - fromSource) / (toSource - fromSource) * (toTarget - fromTarget) + fromTarget;
        }

    }
    public static class Helper {
        public static GameObject FindInChildren(this GameObject go, string name)
        {
            return (from x in go.GetComponentsInChildren<Transform>()
                    where x.gameObject.name == name
                    select x.gameObject).First();
        }

        public static T FindComponentInParent<T>(this GameObject go)
        {
            if(go.transform.parent != null) return go.FindComponentInParent<T>();
            return default(T);
        }
    }
}