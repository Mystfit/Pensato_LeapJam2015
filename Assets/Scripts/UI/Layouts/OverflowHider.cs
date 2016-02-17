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
            Transform child = transform.GetChild(i);
            float childTop = transform.localPosition.y + child.localPosition.y;
            float childBottom = transform.localPosition.y + child.localPosition.y;// LayoutUtility.GetMinHeight(child);
            if (childTop < 0.0f && childBottom > -viewport.sizeDelta.y)
            {
                child.gameObject.SetActive(true);
            }
            else
            {
                child.gameObject.SetActive(true);
            }
        }
    }
}
