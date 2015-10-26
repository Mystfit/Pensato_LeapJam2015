using UnityEngine;
using System.Collections;

public class Hextile : MonoBehaviour {

    private Color color = new Color(0f / 255f, 153f / 255f, 255f / 255f);

    private float pulse;
    private float phase;

    private Color currentCol;

    public int spectrumIndex = 0;
    public int specDataScale = 24;

    float targetColorLerp = 0.0f;

    void Start () {
        spectrumIndex = (int) Mathf.Abs (Vector3.Distance(transform.position, Vector3.zero) - 0.1f );

        currentCol = Color.Lerp(Color.black, color, 0.0f);

        pulse = Random.Range(0.5f, 2.0f);
        phase = Random.Range(1.0f, 2.0f);
    }
	
	void Update ()
    {
        targetColorLerp = Spectrum.specData[spectrumIndex] * specDataScale;

        currentCol = Color.Lerp(Color.black, color, targetColorLerp);

        GetComponent<Renderer>().material.SetColor("_EmissionColor", currentCol);
        GetComponent<Light>().color = currentCol;
    }

    void idlePhase()
    {
        currentCol = Color.Lerp(color, Color.white, 0.1f);
        //currentCol *= Mathf.Pow(Mathf.Sin(Time.time * pulse + phase)*0.5f, 2.0f)+ 0.15f ;
        currentCol *= Mathf.Pow(Mathf.Sin(Time.time * pulse + phase) * 0.49f + 0.51f, 2.0f);
    }
}
