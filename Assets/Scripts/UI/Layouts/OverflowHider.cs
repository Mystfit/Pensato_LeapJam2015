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
            float childBottom = transform.localPosition.y + child.localPosition.y - LayoutUtility.GetMinHeight(child);
            if (childTop < 0.0f && childBottom > -viewport.sizeDelta.y)
            {
                if (!child.GetChild(0).gameObject.activeSelf)
                    child.GetChild(0).gameObject.SetActive(true);
            }

            else
            {
                if (child.GetChild(0).gameObject.activeSelf)
                    child.GetChild(0).gameObject.SetActive(false);
            }
        }
    }
}
