﻿using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using LMWidgets;
using System.Collections.Generic;
using System.IO;
using System;
using System.Linq;


public class HandPoseTrainingController : MonoBehaviour
{
    //UI
    public Transform poseUI;
    public Transform poseStartScreen;
    public Transform poseEndScreen;

    private Text poseTitle;
    private Text poseDescription;
    private Text poseTimer;
    public ButtonBase calibrationStartButton;
    public ButtonBase calibrationSaveButton;
    public ButtonBase calibrationLoadButton;
    public Transform sandbox;

    //RBF References
    public string trainingDataPath = "trainingdata";
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

    // Training targets
    private Dictionary<string, GameObject> m_trainingTargetScenes;

    // Calibration state
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
        // Set up training scene transforms
        m_trainingTargetScenes = new Dictionary<string, GameObject>();
        foreach (string gesture in gestures)
        {
            GameObject trainingTargets = transform.FindChild(gesture).gameObject;
            trainingTargets.SetActive(false);
            m_trainingTargetScenes.Add(gesture, trainingTargets);
        }

        // Set up RBF
        m_currentCalibrationSamples = new List<double[]>();
        leftHandRBF.Init(gestures);
        rightHandRBF.Init(gestures);

        // Set up buttons
        calibrationStartButton.transform.parent.gameObject.SetActive(true);
        calibrationSaveButton.transform.parent.gameObject.SetActive(false);
        calibrationStartButton.StartHandler += CalibrationStartButton_StartHandler;
        calibrationSaveButton.StartHandler += CalibrationSaveButton_StartHandler;
        calibrationLoadButton.StartHandler += CalibrationLoadButton_StartHandler;

        // Set up UI
        Transform panelparent = poseUI.Find("moving_panel");
        poseTitle = panelparent.Find("gesture_name").GetComponent<Text>();
        poseDescription = panelparent.Find("gesture_instructions").GetComponent<Text>();
        poseTimer = panelparent.Find("timer").GetComponent<Text>();
        poseStartScreen.gameObject.SetActive(true);
        poseEndScreen.gameObject.SetActive(false);
        poseUI.gameObject.SetActive(false);
        sandbox.gameObject.SetActive(false);
    }

    private void CalibrationLoadButton_StartHandler(object sender, EventArg<bool> e)
    {
        string[] files = Directory.GetFiles(trainingDataPath);

        for(int hand = 0; hand < Enum.GetNames(typeof(HandPoseRBF.Hand)).Length; hand++)
        {
            string handname = Enum.GetName(typeof(HandPoseRBF.Hand), hand).ToLower();
            string[] rbfTrainingFilenames = Array.FindAll(files, s => Path.GetFileName(s).StartsWith(handname));

            if (rbfTrainingFilenames.Length == 0)
            {
                Debug.LogWarning(string.Format("No RBF training data found for {0} hand", handname));
                continue;
            }

            //Linq descending sort
            var rbfTrainingFilenamesDesc = from s in rbfTrainingFilenames
                                            orderby s descending
                                            select s;

            string latestRbfFile = rbfTrainingFilenamesDesc.First();
            if((hand == 0) ? leftHandRBF.LoadRBF(latestRbfFile) : rightHandRBF.LoadRBF(latestRbfFile))
                Debug.Log(handname.First().ToString().ToUpper() + handname.Substring(1) + " hand RBF loaded from file");
        }

        //UI Updates
        sandbox.gameObject.SetActive(true);
        calibrationSaveButton.transform.parent.gameObject.SetActive(false);
        calibrationStartButton.transform.parent.gameObject.SetActive(false);
        calibrationLoadButton.transform.parent.gameObject.SetActive(false);
        poseStartScreen.gameObject.SetActive(false);
        poseEndScreen.gameObject.SetActive(true);
        m_calibrationState = CalibrationState.CALIBRATED;
    }

    private void CalibrationSaveButton_StartHandler(object sender, EventArg<bool> e)
    {
        string[] allFileNames = Directory.GetFiles(trainingDataPath);
        int existingLeftFiles = Array.FindAll(allFileNames, s => s.StartsWith("lefthand")).Length;
        int existingRightFiles = Array.FindAll(allFileNames, s => s.StartsWith("righthand")).Length;

        leftHandRBF.SaveRBF(string.Format("{0}/lefthand_{1}.json", trainingDataPath, (existingLeftFiles + 1).ToString("D" + 4)));
        rightHandRBF.SaveRBF(string.Format("{0}/righthand_{1}.json", trainingDataPath, (existingLeftFiles + 1).ToString("D" + 4)));
    }

    private void CalibrationStartButton_StartHandler(object sender, EventArg<bool> e)
    {
        m_calibrationState = CalibrationState.POSE_SETUP;
        currentTrainingHand = rightHandRBF;
        m_currentTrainingGestureIndex = 0;
        m_currentTrainingTestIndex = 0;

        //UI Updates
        calibrationStartButton.transform.parent.gameObject.SetActive(false);
        calibrationLoadButton.transform.parent.gameObject.SetActive(false);
        UpdateTrainingTargetsVisible(gestures[m_currentTrainingGestureIndex]);
        UpdateTrainingTargetColours(gestures[m_currentTrainingGestureIndex], m_currentTrainingTestIndex);
        poseStartScreen.gameObject.SetActive(false);
        poseUI.gameObject.SetActive(true);
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
                poseTitle.text += " - " + target.gameObject.name;
                poseUI.transform.position = target.position;
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
                        poseUI.gameObject.SetActive(false);
                        poseEndScreen.gameObject.SetActive(true);
                        sandbox.gameObject.SetActive(true);
                    }
                    break;
                }

                //If hand is missing, pause training
                if(currentTrainingHand.handModel == null)
                {
                    poseDescription.text = string.Format("{0} left. Pausing training.", (currentTrainingHand == rightHandRBF) ? "Right hand" : "Left hand");
                    poseTimer.color = Color.grey;
                }
                else
                {
                    //Update calibration gui
                    poseTitle.text = gestures[m_currentTrainingGestureIndex];
                    poseTimer.color = Color.white;
                    string handText = (currentTrainingHand == rightHandRBF) ? "Right hand" : "Left hand";
                    poseDescription.text = string.Format("{0} {1} the target.", handText, gestures[m_currentTrainingGestureIndex]);

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
                    poseTimer.text = "REC";
                    m_calibrationState = CalibrationState.CAPTURING_SAMPLES;
                    poseTimer.color = Color.red;
                }
                break;
            case CalibrationState.CAPTURING_SAMPLES:
                if(currentTrainingHand.handModel == null)
                {
                    m_calibrationState = CalibrationState.POSE_SETUP;
                    m_currentPoseTime = poseCountdown;
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
