using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System.Collections;

[RequireComponent(typeof(RadialLayout))]
[RequireComponent(typeof(MeshFilter))]
[RequireComponent(typeof(MeshRenderer))]
[ExecuteInEditMode]
public class RadialBackground : UIBehaviour
{
    private RadialLayout m_radial;
    private MeshFilter m_meshFilter;
    public int subdivisions;
    public float planeWidth = 2.0f;

    protected override void Start()
    {
        m_radial = GetComponent<RadialLayout>();
        m_meshFilter = GetComponent<MeshFilter>();
    }

    protected override void OnRectTransformDimensionsChange()
    {
        int numVertices = transform.childCount + subdivisions;
        Vector3[] verts = new Vector3[numVertices * 2];
        int[] indicies = new int[(verts.Length-1) * 3];

        Vector3[] topVerts = GeometryUtils.BuildArcPositions(m_radial.radius, Mathf.PI, numVertices);
        Vector3[] bottomVerts = GeometryUtils.BuildArcPositions(m_radial.radius, Mathf.PI, numVertices);

        for(int vert = 0; vert < numVertices; vert++)
        {
            verts[vert * 2] = topVerts[vert];
            verts[vert * 2 + 1] = bottomVerts[vert];
        }

        for(int i = 0; i < transform.childCount; i++)
        {
            indicies[i * 6 + 0] = i * 2 + 0;
            indicies[i * 6 + 1] = i * 2 + 1;
            indicies[i * 6 + 2] = i * 2 + 2;
            indicies[i * 6 + 3] = i * 2 + 2;
            indicies[i * 6 + 4] = i * 2 + 1;
            indicies[i * 6 + 5] = i * 2 + 3;
        }

        Mesh mesh = m_meshFilter.sharedMesh;
        mesh.vertices = verts;
        mesh.triangles = indicies;
        m_meshFilter.sharedMesh = mesh;
        base.OnRectTransformDimensionsChange();
    }




}
