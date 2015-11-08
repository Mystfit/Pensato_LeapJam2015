using UnityEngine;
using UnityEngine.EventSystems;
using System.Collections;
using System;

[ExecuteInEditMode]
[RequireComponent(typeof(RectTransform))]
[RequireComponent(typeof(RadialLayout))]
[RequireComponent(typeof(MeshFilter))]
[RequireComponent(typeof(MeshRenderer))]
public class RadialHologram : UIBehaviour, IFindsAssets {

    private RadialLayout m_radial;
    private MeshFilter m_meshFilter;
    private RectTransform m_rect;

    [SerializeField]
    private Transform m_origin;
    public Transform origin { set {m_origin = value; BuildFan(); } }

    protected override void OnRectTransformDimensionsChange()
    {
        loadAssets();
        BuildFan();
    }

    private void BuildFan()
    {
        base.OnRectTransformDimensionsChange();
        Vector3[] radialVerts = m_radial.CalculateRadialPoints();
        if (radialVerts.Length < 1)
            return;

        Vector3[] verts = new Vector3[radialVerts.Length + 1];
        Vector2[] uvs = new Vector2[radialVerts.Length + 1];
        int[] indicies = new int[transform.childCount * 3];

        verts[verts.Length - 1] = transform.InverseTransformPoint(m_origin.position);
        for (int i = 0; i < radialVerts.Length; i++)
        {
            verts[i] = new Vector3(radialVerts[i].x, 0.0f, radialVerts[i].y);
            uvs[i] = new Vector2(0.99f, (float)i / (float)radialVerts.Length);
        }
        uvs[uvs.Length - 1] = new Vector2(0.01f, 0.5f);
        verts[verts.Length - 2].y = transform.InverseTransformPoint(transform.GetChild(transform.childCount - 1).position).y;

        for (int i = 0; i < transform.childCount; i++)
        {
            Vector3[] corners = new Vector3[4];
            m_rect.GetWorldCorners(corners);
            verts[i].y = transform.InverseTransformPoint(transform.GetChild(i).position).y - m_rect.sizeDelta.y;
            indicies[i * 3 + 0] = i;
            indicies[i * 3 + 1] = i + 1;
            indicies[i * 3 + 2] = verts.Length - 1;
        }

        if (m_meshFilter == null)
            m_meshFilter = GetComponent<MeshFilter>();

        Mesh mesh = null;
        if (m_meshFilter.sharedMesh == null)
            mesh = m_meshFilter.mesh;
        else
            mesh = m_meshFilter.sharedMesh;
        mesh.Clear();
        mesh.vertices = verts;
        mesh.triangles = indicies;
        mesh.uv = uvs;
        m_meshFilter.sharedMesh = mesh;
    }

    public void loadAssets()
    {
        if (m_meshFilter == null || m_radial == null || m_rect == null)
        {
            m_radial = GetComponent<RadialLayout>();
            m_meshFilter = GetComponent<MeshFilter>();
            m_rect = GetComponent<RectTransform>();
        }
    }
}
