using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System;

public class SnapGridLayoutGroup : LayoutGroup
{
    private SnapGridCell[,] m_cells;
    [SerializeField]
    protected Vector2 m_CellSize = new Vector2(100, 100);
    public Vector2 cellSize { get { return m_CellSize; } set { SetProperty(ref m_CellSize, value); } }

    [SerializeField]
    protected Vector2 m_Spacing = Vector2.zero;
    public Vector2 spacing { get { return m_Spacing; } set { SetProperty(ref m_Spacing, value); } }

    public override void CalculateLayoutInputHorizontal()
    {
        base.CalculateLayoutInputHorizontal();
        Vector2 size = CalculateGridSize();
        SetLayoutInputForAxis(padding.horizontal + size.x, padding.horizontal + size.x, -1, 0);
    }

    public override void CalculateLayoutInputVertical()
    {
        Vector2 size = CalculateGridSize();
        SetLayoutInputForAxis(padding.vertical + size.y, padding.vertical + size.y, -1, 1);
    }

    public override void SetLayoutHorizontal()
    {
        SetCellsAlongAxis(0);
    }

    public override void SetLayoutVertical()
    {
        SetCellsAlongAxis(1);
    }

    private void SetCellsAlongAxis(int axis)
    {
        if (axis == 0)
        {
            // Only set the sizes when invoked for horizontal axis, not the positions.
            for (int i = 0; i < rectChildren.Count; i++)
            {
                RectTransform rect = rectChildren[i];
                SnapGridCell cell = rectChildren[i].GetComponent<SnapGridCell>();

                if (cell == null) throw new MissingComponentException("All objects in a SnapGrid need a cell component!");

                m_Tracker.Add(this, rect,
                    DrivenTransformProperties.Anchors |
                    DrivenTransformProperties.AnchoredPosition |
                    DrivenTransformProperties.SizeDelta);

                rect.anchorMin = Vector2.up;
                rect.anchorMax = Vector2.up;
                rect.sizeDelta = new Vector2(cell.width * (cellSize.x + spacing.x), cell.height * (cellSize.y + spacing.y));
            }
            return;
        }

        float width = rectTransform.rect.size.x;
        float height = rectTransform.rect.size.y;

        int cellCountX = 1;
        int cellCountY = 1;

        if (cellSize.x + spacing.x <= 0)
            cellCountX = int.MaxValue;
        else
            cellCountX = Mathf.Max(1, Mathf.FloorToInt((width - padding.horizontal + spacing.x + 0.001f) / (cellSize.x + spacing.x)));

        if (cellSize.y + spacing.y <= 0)
            cellCountY = int.MaxValue;
        else
            cellCountY = Mathf.Max(1, Mathf.FloorToInt((height - padding.vertical + spacing.y + 0.001f) / (cellSize.y + spacing.y)));

        int cellsPerMainAxis, actualCellCountX, actualCellCountY;
        cellsPerMainAxis = cellCountX;
        actualCellCountX = Mathf.Clamp(cellCountX, 1, rectChildren.Count);
        actualCellCountY = Mathf.Clamp(cellCountY, 1, Mathf.CeilToInt(rectChildren.Count / (float)cellsPerMainAxis));

        Vector2 requiredSpace = new Vector2(
                actualCellCountX * cellSize.x + (actualCellCountX - 1) * spacing.x,
                actualCellCountY * cellSize.y + (actualCellCountY - 1) * spacing.y
                );

        Vector2 startOffset = new Vector2(
                        GetStartOffset(0, requiredSpace.x),
                        GetStartOffset(1, requiredSpace.y)
                        );

        for (int i = 0; i < rectChildren.Count; i++)
        {
            SnapGridCell cell = rectChildren[i].GetComponent<SnapGridCell>();
            if (cell == null) throw new MissingComponentException("All children need SnapGridCell components to work with a SnapGridLayoutGroup.");

            Vector2 actualCellSize = new Vector2(cell.width * cellSize.x, cell.height * cellSize.y);
            Vector2 cellPosition = new Vector2();
            cellPosition.x = cell.x * (cellSize.x + spacing.x) + startOffset.x;
            cellPosition.y = cell.y * (cellSize.y + spacing.y) + startOffset.y;

            SetChildAlongAxis(rectChildren[i], 0, cellPosition.x, actualCellSize.x);
            SetChildAlongAxis(rectChildren[i], 1, cellPosition.y, actualCellSize.y);
        }
    }

    public Vector2 CalculateGridSize()
    {
        float width = 0.0f;
        float height = 0.0f;
        for (int i = 0; i < rectChildren.Count; i++)
        {
            SnapGridCell cell = rectChildren[i].GetComponent<SnapGridCell>();
            if (cell == null) throw new MissingComponentException("All children need SnapGridCell components to work with a SnapGridLayoutGroup.");

            Vector2 actualCellSize = new Vector2(cell.width * cellSize.x, cell.height * cellSize.y);
            Vector2 cellPosition = new Vector2();
            cellPosition.x = Mathf.FloorToInt(cell.x * (cellSize.x + spacing.x));
            cellPosition.y = Mathf.FloorToInt(cell.y * (cellSize.y + spacing.y));
            width = Mathf.Max(cellPosition.x + actualCellSize.x, width);
            height = Mathf.Max(cellPosition.y + actualCellSize.y, height);
        }
        return new Vector2(width, height);
    }
}