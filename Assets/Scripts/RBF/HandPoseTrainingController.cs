using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using LMWidgets;
using System.Collections.Generic;

public class HandPoseTrainingController : MonoBehaviour
{
    //UI
    public Text poseTitle;
    public Text poseDescription;
    public Text poseAltDescription;
    public Text poseTimer;
    public Image poseRecording;
    public ButtonBase calibrationStartButton;
    public ButtonBase calibrationSaveButton;

    //RBF References
    public string[] gestures;
    public HandPoseRBF leftHandRBF;
    public HandPoseRBF rightHandRBF;
    private HandPoseRBF currentTrainingHand;

    //Training
    public float poseCountdown = 3.0f;
    public int calibrationSamples = 150;
    private float m_currentPoseTime;
    private List<double[]> m_currentCalibrationSamples;
    private int m_currentTrainingGestureNumTargets;
    private int m_currentTrainingGestureIndex;
    private int m_currentTrainingTestIndex;
    private double[] m_calibrationAvg;

    //Training targets
    private Dictionary<string, GameObject> m_trainingTargetScenes;

    //Calibration state
    public enum CalibrationState
    {
        AWAITING_CALIBRATION = 0,
        POSE_SETUP,
        WAITING_FOR_POSE,
        CAPTURING_SAMPLES,
        CALIBRATED
    }
    protected CalibrationState m_calibrationState = CalibrationState.AWAITING_CALIBRATION;
    public CalibrationState GetCalibrationState() { return m_calibrationState; }

    void Start()
    {
        m_trainingTargetScenes = new Dictionary<string, GameObject>();
        foreach (string gesture in gestures)
        {
            GameObject trainingTargets = transform.FindChild(gesture).gameObject;
            trainingTargets.SetActive(false);
            m_trainingTargetScenes.Add(gesture, trainingTargets);
        }

        poseRecording.gameObject.SetActive(false);

        m_currentCalibrationSamples = new List<double[]>();
        leftHandRBF.Init(gestures);
        rightHandRBF.Init(gestures);

        calibrationStartButton.transform.parent.gameObject.SetActive(true);
        calibrationSaveButton.transform.parent.gameObject.SetActive(false);
        calibrationStartButton.StartHandler += CalibrationStartButton_StartHandler;
        calibrationSaveButton.StartHandler += CalibrationSaveButton_StartHandler;
    }

    private void CalibrationSaveButton_StartHandler(object sender, EventArg<bool> e)
    {
        leftHandRBF.SaveRBF();
        rightHandRBF.SaveRBF();
    }

    private void CalibrationStartButton_StartHandler(object sender, EventArg<bool> e)
    {
        m_calibrationState = CalibrationState.POSE_SETUP;
        currentTrainingHand = rightHandRBF;
        m_currentTrainingGestureIndex = 0;
        m_currentTrainingTestIndex = 0;
        calibrationStartButton.transform.parent.gameObject.SetActive(false);
        UpdateTrainingTargetsVisible(gestures[m_currentTrainingGestureIndex]);
        UpdateTrainingTargetColours(gestures[m_currentTrainingGestureIndex], m_currentTrainingTestIndex);
    }


    private void UpdateTrainingTargetColours(string gesture, int trainingPointIndex)
    {
        Transform trainingScene = m_trainingTargetScenes[gesture].transform;

        for (int i = 0; i < trainingScene.childCount; i++)
        {
            if (i == trainingPointIndex)
            {
                Transform target = trainingScene.GetChild(trainingPointIndex);
                target.GetComponent<Renderer>().material.SetColor("_Color", new Color(1.0f, 0.0f, 0.0f, 1.0f));
                poseAltDescription.text = target.gameObject.name;
            }
            else
            {
                trainingScene.GetChild(i).GetComponent<Renderer>().material.SetColor("_Color", new Color(1.0f, 1.0f, 1.0f, 0.2f));
            }
        }
    }

    private void UpdateTrainingTargetsVisible(string gesture)
    {
        m_currentTrainingGestureNumTargets = m_trainingTargetScenes[gestures[m_currentTrainingGestureIndex]].transform.childCount;
        foreach (KeyValuePair<string, GameObject> pair in m_trainingTargetScenes)
        {
            if(pair.Key == gesture)
            {
                pair.Value.SetActive(true);
            } else
            {
                pair.Value.SetActive(false);
            }
        }
    }


    void Update()
    {
        switch (m_calibrationState)
        {
            case CalibrationState.AWAITING_CALIBRATION:
                break;
            case CalibrationState.POSE_SETUP:
                m_currentPoseTime = poseCountdown;
                if (m_currentTrainingTestIndex >= m_currentTrainingGestureNumTargets)
                {
                    m_currentTrainingGestureIndex++;
                    m_currentTrainingTestIndex = 0;
                    UpdateTrainingTargetsVisible(gestures[m_currentTrainingGestureIndex]);
                }

                if (m_currentTrainingGestureIndex >= gestures.Length)
                {
                    if (currentTrainingHand == rightHandRBF)
                    {
                        currentTrainingHand = leftHandRBF;
                        m_currentTrainingTestIndex = 0;
                        m_currentTrainingGestureIndex = 0;
                        UpdateTrainingTargetsVisible(gestures[m_currentTrainingGestureIndex]);
                        UpdateTrainingTargetColours(gestures[m_currentTrainingGestureIndex], m_currentTrainingTestIndex);
                    }
                    else
                    {
                        m_calibrationState = CalibrationState.CALIBRATED;
                        leftHandRBF.EndTraining();
                        rightHandRBF.EndTraining();
                        calibrationSaveButton.transform.parent.gameObject.SetActive(true);
                        poseTitle.text = "Training complete!";
                        poseDescription.text = "";
                        poseTimer.text = "";
                        poseAltDescription.text = "";
                    }
                    break;
                }

                //If hand is missing, pause training
                if(currentTrainingHand.handModel == null)
                {
                    poseDescription.text = string.Format("{0} left. Pausing training.", (currentTrainingHand == rightHandRBF) ? "Right hand" : "Left hand");
                } else
                {
                    //Update calibration gui
                    poseTitle.text = gestures[m_currentTrainingGestureIndex];
                    string handText = (currentTrainingHand == rightHandRBF) ? "right hand" : "left hand";
                    poseDescription.text = string.Format("Use your {0} to {1} the target.", handText, gestures[m_currentTrainingGestureIndex]);

                    //Update active calibration target
                    UpdateTrainingTargetColours(gestures[m_currentTrainingGestureIndex], m_currentTrainingTestIndex);
                    m_calibrationState = CalibrationState.WAITING_FOR_POSE;
                }
                break;
            case CalibrationState.WAITING_FOR_POSE:
                if(currentTrainingHand.handModel == null)
                {
                    m_calibrationState = CalibrationState.POSE_SETUP;
                    break;
                }

                //Countdown timer
                m_currentPoseTime -= Time.deltaTime;
                poseTimer.text = m_currentPoseTime.ToString();

                //Timer complete. Start capturing pose samples
                if (m_currentPoseTime <= 0.0f)
                {
                    poseTimer.text = "RECORDING";
                    m_calibrationState = CalibrationState.CAPTURING_SAMPLES;
                    poseRecording.gameObject.SetActive(true);
                }
                break;
            case CalibrationState.CAPTURING_SAMPLES:
                if(currentTrainingHand.handModel == null)
                {
                    m_calibrationState = CalibrationState.WAITING_FOR_POSE;
                    m_currentPoseTime = poseCountdown;
                    poseRecording.gameObject.SetActive(false);
                    break;
                }
                m_currentCalibrationSamples.Add(currentTrainingHand.GetFlatBoneRotations());

                //Average sampled values
                if (m_currentCalibrationSamples.Count >= calibrationSamples)
                {
                    double[] m_calibrationTotal = new double[currentTrainingHand.RBF.numInputs];
                    m_calibrationAvg = new double[currentTrainingHand.RBF.numInputs];
                    foreach (double[] vals in m_currentCalibrationSamples)
                    {
                        for (int i = 0; i < vals.Length; i++)
                        {
                            m_calibrationTotal[i] += vals[i];
                        }
                    }
                    for (int i = 0; i < m_calibrationTotal.Length; i++)
                    {
                        m_calibrationAvg[i] = m_calibrationTotal[i] / calibrationSamples;
                    }

                    //Save training data for current pose into RBF
                    currentTrainingHand.SaveTrainingPoint(m_currentTrainingGestureIndex, m_calibrationAvg);
                    poseRecording.gameObject.SetActive(false);
                    m_currentCalibrationSamples.Clear();
                    
                    //Move onto the next training target
                    m_currentTrainingTestIndex++;
                    m_calibrationState = CalibrationState.POSE_SETUP;
                }
                break;
            case CalibrationState.CALIBRATED:
                break;
        }
    }
}
