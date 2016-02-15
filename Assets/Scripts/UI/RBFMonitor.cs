using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using HandPoses;

public class RBFMonitor : MonoBehaviour {

    public HandPoseRBF hand;
    public GameObject textPrefab;
    private Image _background;
    private LayoutElement[] bars;
    public float maxHeight = 1.0f;

    void Start() {
        bars = new LayoutElement[HandPoseRBF.validPoseNames.Length];
        _background = GetComponent<Image>();
        for (int i = 0; i < bars.Length; i++)
        {
            RectTransform bar = new GameObject("bar").AddComponent<RectTransform>();
            Image barImg = bar.gameObject.AddComponent<Image>();
            LayoutElement barLayout = bar.gameObject.AddComponent<LayoutElement>();
            barLayout.minHeight = maxHeight;
            bar.SetParent(transform, false);
            bar.transform.localPosition = new Vector3(0.0f, 0.0f, 0.1f);
            GameObject label = GameObject.Instantiate(textPrefab);
            label.transform.position = bar.transform.position + new Vector3(0.0f, -0.95f, 0.0f);
            label.transform.SetParent(bar, false);
            //label.transform.localScale = new Vector3(1.0f, 1.0f, 1.0f);
            label.transform.localPosition = new Vector3(0.0f, 0.165f, -0.12f);

            //label.transform.SetParent(bar, false);
            label.GetComponent<Text>().text = HandPoseRBF.GetPoseName((HandPoseRBF.PoseType)i);
            bars[i] = barLayout;
        }
    }


    void Update () {

        if (hand.handModel != null)
            _background.color = Color.blue * new Color(1.0f, 1.0f, 1.0f, 0.5f);
        else
            _background.color = Color.red * new Color(1.0f, 1.0f, 1.0f, 0.5f);

        double[] rawPoseData = hand.GetRawPose();
        for (int i = 0; i < rawPoseData.Length; i++)
            bars[i].minHeight = (float)rawPoseData[i] * maxHeight;
    }
}
