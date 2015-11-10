using UnityEngine;
using System;
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
    public PatchCable trackAmplitudePlug = new PatchCable(PatchCable.PlugType.PLUG);
    public LiveLink liveLink;

    public float audioAmplAvg = 0;
    public float lastAmplAvg = -1;

    void Start () {
        PensatoLeapVREnvCtrl.mainControl = this;
        PensatoLeapVREnvCtrl.currentColor = PensatoLeapVREnvCtrl.colorChoices[0];

        liveSongCtrl = (LiveSongProxyController)LiveSongProxyController.instance;
        addEnvironment(40, 0.025f);

        liveLink.proxyCreationComplete += connectPlugs;
    }

    public void connectPlugs()
    {
        LiveTrackProxyController trackControl = (LiveTrackProxyController)LiveTrackProxyController.instance;
        foreach (LiveTrackProxy track in trackControl.proxies.Values)
            track.amplitudeJack.Connect(trackAmplitudePlug);
    }
	
	void Update ()
    {
        audioAmplAvg = 0;
        int total = 0;
        if (trackAmplitudePlug != null)
        {
            if (trackAmplitudePlug.IsDirty) {
                foreach (PatchCable incoming in trackAmplitudePlug.connections)
                {
                    float[] jackValue = trackAmplitudePlug.jackValue(incoming);
                    if (jackValue != null)
                    {
                        for (int i = 0; i < jackValue.Length; i++)
                        {
                            audioAmplAvg += jackValue[i];
                            total++;
                        }
                    }
                }
            }
            if (trackAmplitudePlug.connections.Count > 0)
            {
                audioAmplAvg /= total;
                if (float.IsNaN(lastAmplAvg))
                    lastAmplAvg = 0.0f;
                if (lastAmplAvg != audioAmplAvg)
                {
                    audioAmplAvg = (audioAmplAvg + lastAmplAvg) / 2;
                    if (float.IsNaN(audioAmplAvg))
                        audioAmplAvg = 0.0f;
                    updateAudioDataToEnv(environments[0].GetComponent<PensatoEnvironment>(), audioAmplAvg);
                    lastAmplAvg = audioAmplAvg;
                }
            }
        }
    }

    public void addEnvironment(int size, float padding)
    {
        GameObject o = new GameObject("PensatoEnv_"+ environments.Count.ToString() );
        o.transform.SetParent(transform, false);

        PensatoEnvironment oEnvScript = o.AddComponent<PensatoEnvironment>();
        oEnvScript.initEnv(tileAsset, size, padding);

        environments.Add(o);
    }

    private void updateAudioDataToEnv(PensatoEnvironment env, float audioData)
    {
        env.addAudioData(audioData);
    }
}
