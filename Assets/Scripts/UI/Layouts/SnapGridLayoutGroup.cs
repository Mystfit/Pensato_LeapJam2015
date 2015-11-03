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

    public bool m_allowOverlap = false;
    public enum OverflowDirection { DOWN = 0, RIGHT, UP, LEFT};
    public OverflowDirection m_overflow;

    [SerializeField]
    protected Vector2 m_Spacing = Vector2.zero;
    public Vector2 spacing { get { return m_Spacing; } set { SetProperty(ref m_Spacing, value); } }

    protected int m_cellColumns = 0;
    public int columns { get { return m_cellColumns; } }

    protected int m_cellRows = 0;
    public int rows { get { return m_cellRows; } }

    public override void CalculateLayoutInputHorizontal()
    {
        base.CalculateLayoutInputHorizontal();
        Vector2 size = CalculateGridSize();
        m_cells = new SnapGridCell[Mathf.CeilToInt(size.x/cellSize.x)+1, Mathf.CeilToInt(size.y / cellSize.y)+1];
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

        int largestCellXPos = 0;
        int largestCellYPos = 0;

        for (int i = 0; i < rectChildren.Count; i++)
        {
            SnapGridCell cell = rectChildren[i].GetComponent<SnapGridCell>();
            if (cell == null) throw new MissingComponentException("All children need SnapGridCell components to work with a SnapGridLayoutGroup.");

            //Remember the cell dimensions of this grid
            largestCellXPos = Math.Max(largestCellXPos, cell.x + cell.width - 1);
            largestCellYPos = Math.Max(largestCellYPos, cell.y + cell.height - 1);

            Vector2 actualCellSize = new Vector2(cell.width * cellSize.x, cell.height * cellSize.y);
            Vector2 cellPosition = new Vector2();
            cellPosition.x = cell.x * (cellSize.x + spacing.x) + startOffset.x;
            cellPosition.y = cell.y * (cellSize.y + spacing.y) + startOffset.y;
                    
            SetChildAlongAxis(rectChildren[i], 0, cellPosition.x, actualCellSize.x);
            SetChildAlongAxis(rectChildren[i], 1, cellPosition.y, actualCellSize.y);

            for (int x = cell.x; x < cell.x + cell.width; x++){
                for (int y = cell.y; y < cell.y + cell.height; y++){
                    m_cells[x, y] = cell;
                }
            }
        }

        m_cellColumns = largestCellXPos + 1;
        m_cellRows = largestCellYPos + 1;
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

    public int[] PositionToCellCoordinates(Vector3 position)
    {
        Vector3 localPos = transform.InverseTransformPoint(position);
        localPos = new Vector3(localPos.x, localPos.y, 0.0f);
        int cellX = Mathf.FloorToInt(localPos.x / rectTransform.sizeDelta.x * columns);
        int cellY = Mathf.FloorToInt(localPos.y / rectTransform.sizeDelta.y * -rows);
        return new int[] { cellX, cellY };
    }

    public int[] RectToCellSizes(RectTransform rect)
    {
        int width = Mathf.RoundToInt(rect.sizeDelta.x / cellSize.x);
        int height = Mathf.RoundToInt(rect.sizeDelta.y / cellSize.y);
        return new int[] { width, height };
    }

    public bool CheckCellsOccupied(int xCell, int yCell, int width, int height)
    {
        for(int x = xCell; x < xCell + width; x++)
        {
            for (int y = yCell; y < yCell + height; y++)
            {
                if (m_cells[x, y] != null) return true;
            }
        }
        return false;
    }

    public int[] CalculateOverlapOffset(SnapGridCell cell)
    {
        return CalculateOverlapOffset(cell, cell.x, cell.y);
    }

    public int[] CalculateOverlapOffset(SnapGridCell cell, int xPos, int yPos)
    {
        xPos = Math.Max(0, Math.Min(xPos, m_cellColumns));
        yPos = Math.Max(0, Math.Min(yPos, m_cellRows));
        int[] overlapOffset = new int[2];

        if (xPos > m_cellColumns-1 || yPos > m_cellRows-1) return overlapOffset;
       
        for (int x = xPos; x < xPos + cell.width; x++)
        {
            for (int y = yPos; y < yPos + cell.height; y++)
            {
                if (x >= m_cellColumns || y >= m_cellRows)
                    continue;

                if (m_cells[x, y] != null &&
                    m_cells[x, y] != cell &&
                    !m_cells[x, y].forcedOverlap &&
                    !m_allowOverlap 
                    )
                {
                    return NearestValidPosition(cell, xPos, yPos);
                }
            }
        }

        return overlapOffset;
    }

    private int[] NearestValidPosition(SnapGridCell cell, int xPos, int yPos)
    {
        int[] overlapOffset = new int[2];
        int shortestOffset = -1;
        OverflowDirection shortestDir = m_overflow;
        int offset = 0;
        OverflowDirection cDir = 0;
        foreach (OverflowDirection dir in Enum.GetValues(typeof(OverflowDirection)))
        {
            offset = 0;
            switch (dir)
            {
                case OverflowDirection.DOWN:
                    cDir = OverflowDirection.DOWN;

                    while (m_cells[xPos, yPos + offset] != null &&
                        m_cells[xPos, yPos + offset] != cell &&
                        yPos + offset <= m_cellRows)
                    {
                        offset++;
                    }
                    break;
                case OverflowDirection.RIGHT:
                    cDir = OverflowDirection.RIGHT;
                    while (m_cells[xPos + offset, yPos] != null &&
                        m_cells[xPos + offset, yPos] != cell &&
                        xPos + offset <= m_cellColumns)
                    {
                        offset++;
                    }
                    break;
                case OverflowDirection.UP:
                    while (m_cells[xPos, yPos + offset] != null &&
                        m_cells[xPos, yPos + offset] != cell)
                    {
                        offset -= cell.height;
                        if (yPos + offset <= 0)
                        {
                            offset = m_cellRows; //Ran out of space. Don't use this direction.
                            break;
                        }
                    }
                    break;
                case OverflowDirection.LEFT:
                    cDir = OverflowDirection.RIGHT;
                    while (m_cells[xPos + offset, yPos] != null &&
                        m_cells[xPos + offset, yPos] != cell)
                    {
                        offset -= cell.width;
                        if (xPos + offset <= 0)
                        {
                            offset = m_cellColumns; //Ran out of space. Don't use this direction.
                            break;
                        }
                    }
                    break;
            }

            if (offset < shortestOffset || shortestOffset < 0)
            {
                shortestOffset = offset;
                shortestDir = cDir;
            }
        }
        if (shortestDir == OverflowDirection.DOWN || shortestDir == OverflowDirection.UP)
            overlapOffset[1] = shortestOffset;
        else if (shortestDir == OverflowDirection.LEFT || shortestDir == OverflowDirection.RIGHT)
            overlapOffset[0] = shortestOffset;
        return overlapOffset;
    }
}