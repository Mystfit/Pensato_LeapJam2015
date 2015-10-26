using UnityEngine;
using UnityEngine.UI;
using System.Collections;

[ExecuteInEditMode]
public class ScrollLock : MonoBehaviour {

    private RectTransform rect;
    public RectTransform viewport;

    void Awake()
    {
        rect = GetComponent<RectTransform>();
    }


	void Update () {
	    if(transform.localPosition.y > viewport.sizeDelta.y)
        {
            transform.localPosition = new Vector3(transform.localPosition.x, LayoutUtility.GetMinHeight(viewport), transform.localPosition.z);
        } else if (transform.localPosition.y < 0.0f)
        {
            transform.localPosition = new Vector3(transform.localPosition.x, 0.0f, transform.localPosition.z);
        }
	}
}
