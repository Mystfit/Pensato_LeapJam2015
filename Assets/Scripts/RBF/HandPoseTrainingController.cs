using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;

public class HandPoseTrainingController : MonoBehaviour
{
    public string[] gestures;
    public HandPoseRBF leftHandRBF;
    public HandPoseRBF rightHandRBF;
    private HandPoseRBF currentTrainingHand;

    public Text poseTitle;
    public Text poseDescription;
    public Text poseTimer;
    public Image poseRecording;

    //Training
    public float m_calibrateReadyCountdown = 3.0f;
    public float m_calibrateDuration = 2.0f;
    public int m_calibrationSamples = 60;
    public int numTrainingTests = 5;
    protected float m_currentCalibrateTime = 0.0f;
    private List<double[]> m_currentCalibrationSamples;
    private int m_currentTrainingGestureIndex;
    private int m_currentTrainingTestIndex;
    private double[] m_calibrationAvg;

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
        m_currentCalibrationSamples = new List<double[]>();
        leftHandRBF.Init(gestures);
        rightHandRBF.Init(gestures);
    }

    public void StartTraining()
    {
        m_calibrationState = CalibrationState.POSE_SETUP;
        currentTrainingHand = rightHandRBF;
        m_currentTrainingGestureIndex = 0;
        m_currentTrainingTestIndex = 0;
        UpdateTrainingTargetColours(gestures[0], 0);
    }

    public void UpdateTrainingTargetColours(string gesture, int trainingPointIndex)
    {
        Transform trainingScene = transform.FindChild(gesture);
        if (trainingScene != null)
        {
            for (int i = 0; i < trainingScene.childCount; i++)
            {
                if (i == trainingPointIndex)
                {
                    trainingScene.GetChild(trainingPointIndex).GetComponent<Renderer>().material.SetColor("_Color", new Color(1, 0, 0, 1));
                }
                else
                {
                    trainingScene.GetChild(i).GetComponent<Renderer>().material.SetColor("_Color", new Color(1, 1, 1, 1));
                }
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
                m_calibrateReadyCountdown = m_currentCalibrateTime;
                if (m_currentTrainingTestIndex >= numTrainingTests)
                {
                    m_currentTrainingGestureIndex++;
                    m_currentTrainingTestIndex = 0;
                }

                if (m_currentTrainingGestureIndex >= gestures.Length)
                {
                    if (currentTrainingHand == rightHandRBF)
                    {
                        currentTrainingHand = leftHandRBF;
                        m_currentTrainingTestIndex = 0;
                        m_currentTrainingGestureIndex = 0;
                    }
                    else
                    {
                        m_calibrationState = CalibrationState.CALIBRATED;
                        leftHandRBF.SaveRBF();
                        rightHandRBF.SaveRBF();
                        poseTitle.text = "Training complete!";
                        poseDescription.text = "";
                        poseTimer.text = "";
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
                    poseTitle.text = string.Format("{0}: {1}", gestures[m_currentTrainingGestureIndex], m_currentTrainingTestIndex);
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
                m_calibrateReadyCountdown -= Time.deltaTime;
                poseTimer.text = m_calibrateReadyCountdown.ToString();

                //Timer complete. Start capturing pose samples
                if (m_calibrateReadyCountdown <= 0.0f)
                {
                    m_calibrationState = CalibrationState.CAPTURING_SAMPLES;
                    m_currentCalibrateTime = m_calibrateDuration;
                    poseRecording.gameObject.SetActive(true);
                }
                break;
            case CalibrationState.CAPTURING_SAMPLES:
                if(currentTrainingHand.handModel == null)
                {
                    m_calibrationState = CalibrationState.WAITING_FOR_POSE;
                    m_currentCalibrateTime = m_calibrateReadyCountdown;
                    poseRecording.gameObject.SetActive(false);
                    break;
                }
                m_currentCalibrationSamples.Add(currentTrainingHand.GetFlatBoneRotations());

                //Average sampled values
                if (m_currentCalibrationSamples.Count >= m_calibrationSamples)
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
                        m_calibrationAvg[i] = m_calibrationTotal[i] / m_calibrationSamples;
                    }

                    //Save training data for current pose into RBF
                    currentTrainingHand.SaveTrainingPoint(m_currentTrainingGestureIndex, m_calibrationAvg);
                    poseRecording.gameObject.SetActive(false);

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
