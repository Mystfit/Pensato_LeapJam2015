using UnityEngine;
using UnityEngine.UI;
using System.Collections;

[ExecuteInEditMode]
public class OverflowHider : MonoBehaviour {

    public RectTransform viewport; 

    void Update()
    {
        if (viewport != null)
        {
            CalculateVisible();
        }
    }


    private void CalculateVisible()
    {
        
        for (int i = 0; i < transform.childCount; i++)
        {
            RectTransform child = (RectTransform)transform.GetChild(i);
            float childTop = transform.localPosition.y + child.localPosition.y;
            float childBottom = transform.localPosition.y + child.localPosition.y - child.sizeDelta.y;// LayoutUtility.GetMinHeight(child);
            if (childTop < 0.0f && childBottom > -viewport.sizeDelta.y)
            {
                for(int j = 0; j < child.childCount; j++)
                {
                    child.GetChild(j).gameObject.SetActive(true);
                }
            }
            else
            {
                for (int j = 0; j < child.childCount; j++)
                {
                    child.GetChild(j).gameObject.SetActive(false);
                }
            }
        }
    }
}
