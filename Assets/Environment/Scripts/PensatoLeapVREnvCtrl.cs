using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PensatoLeapVREnvCtrl : MonoBehaviour {

    public static PensatoLeapVREnvCtrl mainControl;

    public static Color[] colorChoices = {
        new Color(0f / 255f, 153f / 255f, 255f / 255f),
        new Color(84f / 255f, 163f / 255f, 255f / 255f),
        new Color(155f / 255f, 255f / 255f, 30f / 255f),
        new Color(255f / 255f, 47f  / 255f,   0f / 255f)
    };

    public static Color currentColor;

    LiveSongProxyController liveSongCtrl;
    public bool ready = false;

    public GameObject tileAsset;
    public List<GameObject> environments = new List<GameObject>();

    public float audioAmplAvg = 0;
    public float lastAmplAvg = -1;

    // Use this for initialization
    void Start () {
        PensatoLeapVREnvCtrl.mainControl = this;
        PensatoLeapVREnvCtrl.currentColor = PensatoLeapVREnvCtrl.colorChoices[0];

        liveSongCtrl = GameObject.Find("showtime_live").GetComponent<LiveSongProxyController>();

        addEnvironment(40, 0.025f);
    }
	
	// Update is called once per frame
	void Update () {
        ready = (liveSongCtrl.trackData.Length > 0);

        if(ready)
        {
            audioAmplAvg = 0;
            for (int i = 0; i < liveSongCtrl.trackData.Length; i++)
            {
                audioAmplAvg += liveSongCtrl.trackData[i];
            }
            audioAmplAvg /= liveSongCtrl.trackData.Length;

            if (lastAmplAvg != audioAmplAvg)
            {
                audioAmplAvg = (audioAmplAvg + lastAmplAvg) / 2;
                updateAudioDataToEnv(environments[0].GetComponent<PensatoEnvironment>(), audioAmplAvg);
                lastAmplAvg = audioAmplAvg;
            }
        }
    }

    public void addEnvironment(int size, float padding)
    {
        GameObject o = new GameObject("PensatoEnv_"+ environments.Count.ToString() );
        o.transform.parent = this.transform;

        PensatoEnvironment oEnvScript = o.AddComponent<PensatoEnvironment>();
        oEnvScript.initEnv(tileAsset, size, padding);

        environments.Add(o);
    }

    private void updateAudioDataToEnv(PensatoEnvironment env, float audioData)
    {
        env.addAudioData(audioData);
    }
}
