using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class ScrollTargetButton : MonoBehaviour {

    private MomentaryButton m_button;
    public RectTransform target;
    public int byRows = 1;

    
    public bool kinetic;
    public float maxSpeed;
    public float acceleration;
    public float friction;
    private float velocity;
    private bool isScrolling;

    public enum VerticalScrollDirection {  UP = 0, DOWN};
    public VerticalScrollDirection scrollDirection;

	void Awake () {
        m_button = GetComponentInChildren<MomentaryButton>();
        m_button.StartHandler += startScroll;
        m_button.EndHandler += stopScroll;
    }

    private void startScroll(object sender, LMWidgets.EventArg<bool> e)
    {
        if (kinetic)
        {
            isScrolling = true;
        } else
        {
            float rowHeight = LayoutUtility.GetMinHeight((RectTransform)target.GetChild(0));
            if (scrollDirection == VerticalScrollDirection.DOWN)
                target.localPosition = new Vector3(target.localPosition.x, target.localPosition.y - (rowHeight * byRows), target.localPosition.z);
            else if (scrollDirection == VerticalScrollDirection.UP)
                target.localPosition = new Vector3(target.localPosition.x, target.localPosition.y + (rowHeight * byRows), target.localPosition.z);
        }
    }

    private void stopScroll(object sender, LMWidgets.EventArg<bool> e)
    {
        float rowHeight = LayoutUtility.GetMinHeight((RectTransform)target.GetChild(0));
        if (kinetic)
        {
            isScrolling = false;
        } else
        {
            if (scrollDirection == VerticalScrollDirection.DOWN)
                target.localPosition = new Vector3(target.localPosition.x, target.localPosition.y - (rowHeight * byRows), target.localPosition.z);
            else if (scrollDirection == VerticalScrollDirection.UP)
                target.localPosition = new Vector3(target.localPosition.x, target.localPosition.y + (rowHeight * byRows), target.localPosition.z);
        }
    }

    void Update()
    {
        if (isScrolling)
        {
            if (scrollDirection == VerticalScrollDirection.DOWN)
                velocity += acceleration;
            else
                velocity -= acceleration;
        }

        velocity *= friction;
        target.localPosition = new Vector3(target.localPosition.x, target.localPosition.y + velocity, target.localPosition.z);
    }
}
