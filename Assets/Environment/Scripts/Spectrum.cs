using UnityEngine;
using System.Collections;

public class Spectrum : MonoBehaviour {

    public AudioSource sound;
    int samples = 1024;
    public static float[] specData;

    float rootMeanSquared;

	void Start () {
        Spectrum.specData = new float[samples];
        sound = GetComponent<AudioSource>();
	}
	
	void Update () {
        sound.GetSpectrumData(Spectrum.specData, 0, FFTWindow.BlackmanHarris);
    }

    public float getRMSValue()
    {
        return rootMeanSquared;
    }

    void getAmplitude()
    {
        float sumOfSamplesSquared = 0;
        foreach (float item in specData)
        {
            sumOfSamplesSquared += Mathf.Pow(item, 2);
        }
        rootMeanSquared = Mathf.Sqrt(sumOfSamplesSquared / samples);
    }
}
