using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
[RequireComponent(typeof(RectTransform))]
public class RadialLayout : MonoBehaviour
{

    public float radius;
    public float arcSize;
    public float separation;
    public bool fitWidth = false;

    public enum FacingDirections { INWARDS = 0, OUTWARDS };
    public FacingDirections facingDirection;

    void Awake()
    {
        PlaceChildren();
    }



    public void OnTransformChildrenChanged()
    {
        PlaceChildren();
    }

    private void PlaceChildren()
    {
        if (fitWidth)
        {
            float[] widths = new float[transform.childCount];
            for(int i = 0; i < transform.childCount; i++)
            {
                //Need to grab widths from child. Either rect width or bounding box size
                widths[i] = ((RectTransform)transform.GetChild(i)).rect.size.x;
            }
        }
        Vector3[] points = GeometryUtils.BuildArcPositions(radius, arcSize, transform.childCount, separation, -Mathf.PI * 0.5f, true);
        for (int i = 0; i < points.Length; i++)
        {
            points[i].z = points[i].y;
            points[i].y = 0.0f;
        }

        for (int i = 0; i < transform.childCount; i++)
        {
            Transform child = transform.GetChild(i);
            child.localPosition = points[i];

            if (facingDirection == FacingDirections.INWARDS)
                child.rotation = Quaternion.LookRotation(child.position - transform.position);
            else
                child.LookAt(transform);
        }
    }
}
