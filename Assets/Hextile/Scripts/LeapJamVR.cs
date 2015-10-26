using UnityEngine;
using System.Collections;

public class LeapJamVR : MonoBehaviour {

    public static LeapJamVR mainControl;

    private int hexGridRad = 20;
    public GameObject hextile;

    public GameObject[] tiles;

    Spectrum spectrumCtrl;

    // Use this for initialization
    void Start () {
        LeapJamVR.mainControl = this;

        drawHexGrid(hexGridRad, 4.5f);

        tiles = GameObject.FindGameObjectsWithTag("hextile");
    }
	
	// Update is called once per frame
	void Update () {
        //for(int i=0; i< tiles.Length; i++)
        //{
        //    Vector3 prevScale = tiles[i].transform.localScale;
        //    prevScale.z = spectrumCtrl.freqData[i] * -1000;
        //    //prevScale.z = spectrumCtrl.getRMSValue()*1000;
        //    tiles[i].transform.localScale = prevScale;
        //}
    }

    //Draw grid -> http://stackoverflow.com/questions/20734438/algorithm-to-generate-a-hexagonal-grid-with-coordinate-system
    void drawHexGrid(int size, float padding)
    {
        int oddFix = (size % 2 == 0) ? 1 : 0;
        float ang30 = Mathf.Deg2Rad * 30;
        float xOff = Mathf.Cos(ang30) * padding;
        float yOff = Mathf.Sin(ang30) * padding;
        int half = size / 2;

        for(int row =0; row < size+ oddFix; row++)
        {
            int cols = size - Mathf.Abs(row - half)+ oddFix;
            
            for(int col=0; col < cols; col++)
            {
                Vector3 p = Vector3.zero;
                p.x = xOff * (col * 2 + 1 - cols);
                p.z = yOff * (row - half) * 3;
                Instantiate(hextile, p, Quaternion.Euler(90, 0, 0));
            }
        }
    }
}
