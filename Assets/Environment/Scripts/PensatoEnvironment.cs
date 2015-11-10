using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PensatoEnvironment : MonoBehaviour {

    public List<float> audioData;
    private float dataUpdate = 0.0f;
    private bool updatedable = false;

    public int envSize = 50;
    public float envPadding = 0.025f;

    private int samples = 128;

    public List<GameObject> assets = new List<GameObject>();

    void Awake()
    {
        audioData = new List<float>(new float[samples]);
    }

	// Use this for initialization
	void Start () {
        
    }
	
	// Update is called once per frame
	void Update () {
        
    }

    void FixedUpdate()
    {
        updateAudioData();
    }

    public void addAudioData(float d)
    {
        dataUpdate = d;
        updatedable = true;
    }

    public void initEnv(GameObject asset, int size, float padding)
    {
        int oddFix = (size % 2 == 0) ? 1 : 0;
        float ang30 = Mathf.Deg2Rad * 30;
        float xOff = Mathf.Cos(ang30) * padding;
        float yOff = Mathf.Sin(ang30) * padding;
        int half = size / 2;

        float maxDist = size * padding;

        for (int row = 0; row < size + oddFix; row++)
        {
            int cols = size - Mathf.Abs(row - half) + oddFix;

            for (int col = 0; col < cols; col++)
            {
                Vector3 p = Vector3.zero;
                p.x = xOff * (col * 2 + 1 - cols);
                p.z = yOff * (row - half) * 3;

                GameObject t = (GameObject)Instantiate(asset, p, Quaternion.Euler(90, 0, 0));
                t.transform.SetParent(gameObject.transform, false);

                Hextile script = t.GetComponent<Hextile>();
                script.idx = (int)Mathf.Abs((Vector3.Distance(t.transform.localPosition, transform.localPosition) / (maxDist * 1.1f)) * samples);
                script.setAudioData(audioData);
                assets.Add(t);
            }
        }
    }

    private void updateAudioData()
    {
        if (updatedable)
        {
            audioData.Insert(0, dataUpdate);
            audioData.RemoveAt(audioData.Count - 1);
            updatedable = false;
        }
        else
        {
            dataUpdate = 0;
            audioData.Insert(0, dataUpdate);
            audioData.RemoveAt(audioData.Count - 1);
        }
    }
}
