using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Hextile : MonoBehaviour
{
    private Color currentCol;
    private Color targetCol;

    public float targetColorLerp = 0.0f;

    public int idx = 0;

    float dataScale = 0.5f;

    private Material mat;

    private PensatoEnvironment parentEnv;
    private List<float> audioData;

    void Start()
    {
        currentCol = Color.black;
        GetComponent<Renderer>().material.SetColor("_EmissionColor", currentCol);

        mat = GetComponent<Renderer>().material;
        //parentEnv = transform.parent.GetComponent<PensatoEnvironment>();
    }

    void Update()
    {
        //if (PensatoLeapVREnvCtrl.mainControl.ready)
        //{
        //    targetColorLerp = audioData[idx] * dataScale - 0.5f;
        //    targetColorLerp += Random.Range(-audioData[idx] * 0.5f, audioData[idx] * 0.5f);
        //}

        float amp = 0.0f;
        if (audioData.Count > 0)
            amp = audioData[idx];
        targetColorLerp = amp * dataScale - 0.1f;

        targetCol = Color.Lerp(Color.black, PensatoLeapVREnvCtrl.currentColor, targetColorLerp);
        currentCol = Color.Lerp(currentCol, targetCol, 0.4f);

        mat.SetColor("_EmissionColor", currentCol);
        //GetComponent<Light>().color = currentCol;
    }

    public void setAudioData(List<float> aud)
    {
        audioData = aud;
    }

}
