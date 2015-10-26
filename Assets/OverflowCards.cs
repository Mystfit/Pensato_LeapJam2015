using UnityEngine;
using System.Collections;

public class OverflowCards : MonoBehaviour
{
    public int maxItems;
     

    public void OnTransformChildrenChanged()
    {
        if(transform.childCount > maxItems)
        {
            //
        }
    }
}
