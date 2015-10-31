using System;
using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using UnityEngine.EventSystems;

[ExecuteInEditMode]
[RequireComponent(typeof(RectTransform))]
public class SnapGridCell : UIBehaviour
{
    [SerializeField] private int m_width = 1;
    public int width { get { return m_width; } set {m_width = Math.Max(value, 1); SetDirty();  } }

    [SerializeField] private int m_height = 1;
    public int height { get { return m_height; } set { m_height = Math.Max(value, 1); SetDirty(); } }

    [SerializeField] private int m_x = 0;
    public int x { get { return m_x; } set { m_x = Math.Max(value, 0); SetDirty(); } }

    [SerializeField] private int m_y = 0;
    public int y { get { return m_y; } set { m_y = Math.Max(value, 0); SetDirty(); } }

    #if UNITY_EDITOR
    protected override void OnValidate() {SetDirty(); }
    #endif

    public void SetDirty()
    {
        if (!IsActive())
            return;
        LayoutRebuilder.MarkLayoutForRebuild(transform as RectTransform);
    }
}