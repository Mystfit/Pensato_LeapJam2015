﻿using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
[RequireComponent(typeof(MeshFilter))]
[RequireComponent(typeof(MeshRenderer))]
public class ArcMesh : MonoBehaviour {

    public float startAngle = 0.0f;
    public float endAngle = 360.0f;
    public float height = 0.0f;
    public float radius = 1.0f;
    public int segments = 36;
    public bool closed = true;

    private MeshFilter m_meshFilter;

	// Use this for initialization
	void Awake () {
	
	}

    public void Build()
    {
        float angleDeg = (endAngle - startAngle) / segments;
        float angleInc = Mathf.Deg2Rad * angleDeg;
        int actualSegments = segments+1;

        //If we are a closed shape and we're over 360 degrees, don't waste a hidden face
        actualSegments = (closed && endAngle - startAngle >= 360) ? actualSegments - 1 : actualSegments;
        Vector3[] verts = new Vector3[actualSegments * 2];
        Vector2[] uvs = new Vector2[actualSegments * 2];
        int numQuads = (closed) ? actualSegments : segments;
        int[] indicies = new int[numQuads * 6];

        for(int i = 0; i < actualSegments; i++)
        {
            verts[i * 2] = new Vector3(
                Mathf.Cos(angleInc * i + (Mathf.Deg2Rad * startAngle)) * radius,
                height * 0.5f,
                Mathf.Sin(angleInc * i + (Mathf.Deg2Rad * startAngle)) * radius);
            verts[i * 2 + 1] = new Vector3(
                Mathf.Cos(angleInc * i + (Mathf.Deg2Rad * startAngle)) * radius,
                height * -0.5f,
                Mathf.Sin(angleInc * i + (Mathf.Deg2Rad * startAngle)) * radius);
            uvs[i * 2] = new Vector2((float)i/ actualSegments,  1.0f);
            uvs[i * 2 + 1] = new Vector2((float)i / actualSegments, 0.0f);
        }

        for (int i = 0; i < numQuads; i++)
        {
            indicies[i * 6] = (i * 2);
            indicies[i * 6 + 1] = ((i * 2) + 2) % verts.Length; 
            indicies[i * 6 + 2] = (i * 2) + 1;
            indicies[i * 6 + 3] = (i * 2) + 1;
            indicies[i * 6 + 4] = ((i * 2) + 2) % verts.Length; 
            indicies[i * 6 + 5] = ((i * 2) + 3) % verts.Length;
        }

        if (m_meshFilter == null)
            m_meshFilter = GetComponent<MeshFilter>();

        Mesh mesh = new Mesh();
        mesh.Clear();
        mesh.vertices = verts;
        mesh.triangles = indicies;
        mesh.uv = uvs;
        mesh.RecalculateNormals();
        m_meshFilter.sharedMesh = mesh;
    }
}
