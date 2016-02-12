using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using HandPoses;

public class RBFMonitor : MonoBehaviour {

    public HandPoseRBF hand;
    public GameObject textPrefab;

    private LayoutElement[] bars;
    public float maxHeight = 1.0f;

    void Start() {
        bars = new LayoutElement[HandPoseRBF.validPoseNames.Length];
        for (int i = 0; i < bars.Length; i++)
        {
            RectTransform bar = new GameObject("bar").AddComponent<RectTransform>();
            Image barImg = bar.gameObject.AddComponent<Image>();
            LayoutElement barLayout = bar.gameObject.AddComponent<LayoutElement>();
            barLayout.minHeight = maxHeight;
            bar.SetParent(transform, false);
            bar.transform.localPosition = new Vector3(0.0f, 0.0f, 0.1f);
            //GameObject label = GameObject.Instantiate(textPrefab);
            //label.transform.SetParent(bar, false);
            //label.transform.localPosition = new Vector3(0.0f, 0.0f, -0.2f);
            //label.GetComponent<Text>().text = HandPoseRBF.GetPoseName((HandPoseRBF.PoseType)i);
            bars[i] = barLayout;
        }
    }


    void Update () {
        double[] rawPoseData = hand.GetRawPose();
        for (int i = 0; i < rawPoseData.Length; i++)
        {
            bars[i].minHeight = (float)rawPoseData[i] * maxHeight;
        }
    }
}
