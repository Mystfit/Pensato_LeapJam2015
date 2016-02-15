using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using LMWidgets;
using System.Collections.Generic;
using System;
using System.Linq;
using HandPoses;
using System.IO;

namespace HandPoses
{
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
        public HandPoseRBF leftHandRBF;
        public HandPoseRBF rightHandRBF;
        private HandPoseRBF currentTrainingHand;

        //Training
        public float poseCountdown = 3.0f;
        public int calibrationSamples = 150;
        public float sigma = 0.5f;
        private float m_currentPoseTime;
        private List<double[]> m_currentCalibrationSamples;
        private int m_currentTrainingPoseNumTargets;
        private HandPoseRBF.PoseType m_currentTrainingPose;
        private int m_currentTrainingPoseTest;
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
            foreach (string poseName in HandPoseRBF.validPoseNames)
            {
                GameObject trainingTargets = transform.FindChild(poseName).gameObject;
                trainingTargets.SetActive(false);
                m_trainingTargetScenes.Add(poseName, trainingTargets);
            }

            // Set up RBF
            m_currentCalibrationSamples = new List<double[]>();

            // Set up buttons
            calibrationStartButton.transform.parent.gameObject.SetActive(true);
            calibrationSaveButton.transform.parent.gameObject.SetActive(false);
            calibrationStartButton.StartHandler += CalibrationStartButton_StartHandler;
            calibrationSaveButton.StartHandler += CalibrationSaveButton_StartHandler;
            calibrationLoadButton.StartHandler += CalibrationLoadButton_StartHandler;

            // Set up UI
            Transform panelparent = poseUI.Find("moving_panel");
            poseTitle = panelparent.Find("pose_name").GetComponent<Text>();
            poseDescription = panelparent.Find("pose_instructions").GetComponent<Text>();
            poseTimer = panelparent.Find("timer").GetComponent<Text>();
            poseStartScreen.gameObject.SetActive(true);
            poseEndScreen.gameObject.SetActive(false);
            poseUI.gameObject.SetActive(false);
            sandbox.gameObject.SetActive(false);
        }

        private void CalibrationLoadButton_StartHandler(object sender, EventArg<bool> e)
        {
            leftHandRBF.LoadLatestRBF(trainingDataPath, HandPoseRBF.Hand.LEFT);
            rightHandRBF.LoadLatestRBF(trainingDataPath, HandPoseRBF.Hand.RIGHT);

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
            m_currentTrainingPose = 0;
            m_currentTrainingPoseTest = 0;
            leftHandRBF.isTrained = false;
            rightHandRBF.isTrained = false;

            //UI Updates
            calibrationSaveButton.transform.parent.gameObject.SetActive(false);
            calibrationStartButton.transform.parent.gameObject.SetActive(false);
            calibrationLoadButton.transform.parent.gameObject.SetActive(false);
            UpdateTrainingTargetsVisible(m_currentTrainingPose);
            UpdateTrainingTargetColours(m_currentTrainingPose, m_currentTrainingPoseTest);
            poseStartScreen.gameObject.SetActive(false);
            poseUI.gameObject.SetActive(true);
        }


        private void UpdateTrainingTargetColours(HandPoseRBF.PoseType pose, int trainingPointIndex)
        {
            Transform trainingScene = m_trainingTargetScenes[HandPoseRBF.GetPoseName(pose)].transform;

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

        private void UpdateTrainingTargetsVisible(HandPoseRBF.PoseType pose)
        {
            m_currentTrainingPoseNumTargets = m_trainingTargetScenes[HandPoseRBF.GetPoseName(pose)].transform.childCount;
            foreach (KeyValuePair<string, GameObject> pair in m_trainingTargetScenes)
            {
                if ( pair.Key == HandPoseRBF.GetPoseName(pose))
                {
                    pair.Value.SetActive(true);
                }
                else
                {
                    pair.Value.SetActive(false);
                }
            }
        }

        void Update()
        {
            if (m_calibrationState == CalibrationState.WAITING_FOR_POSE ||
                m_calibrationState == CalibrationState.CAPTURING_SAMPLES ||
                m_calibrationState == CalibrationState.POSE_SETUP)
            {
                if (Input.GetKeyDown(KeyCode.LeftArrow))
                {
                    //Rewind training
                    m_currentCalibrationSamples.Clear();
                    m_currentPoseTime = poseCountdown;
                    if (--m_currentTrainingPoseTest < 0)
                    {
                        m_currentTrainingPoseTest = 0;
                        m_currentTrainingPose = (HandPoseRBF.PoseType)Math.Max((int)--m_currentTrainingPose, 0);
                    }
                    m_calibrationState = CalibrationState.POSE_SETUP;
                }
            }

            switch (m_calibrationState)
            {
                case CalibrationState.AWAITING_CALIBRATION:
                    break;
                case CalibrationState.POSE_SETUP:
                    m_currentPoseTime = poseCountdown;
                    if (m_currentTrainingPoseTest >= m_currentTrainingPoseNumTargets)
                    {
                        m_currentTrainingPose++;
                        m_currentTrainingPoseTest = 0;
                        UpdateTrainingTargetsVisible(m_currentTrainingPose);
                    }

                    if ((int)m_currentTrainingPose >= HandPoseRBF.validPoseNames.Length)
                    {
                        if (currentTrainingHand == rightHandRBF)
                        {
                            currentTrainingHand = leftHandRBF;
                            m_currentTrainingPoseTest = 0;
                            m_currentTrainingPose = 0;
                            UpdateTrainingTargetsVisible(m_currentTrainingPose);
                            UpdateTrainingTargetColours(m_currentTrainingPose, m_currentTrainingPoseTest);
                        }
                        else
                        {
                            m_calibrationState = CalibrationState.CALIBRATED;
                            leftHandRBF.EndTraining();
                            rightHandRBF.EndTraining();
                            foreach (KeyValuePair<string, GameObject> t in m_trainingTargetScenes)
                                t.Value.SetActive(false);
                            calibrationSaveButton.transform.parent.gameObject.SetActive(true);
                            calibrationStartButton.transform.parent.gameObject.SetActive(true);
                            poseUI.gameObject.SetActive(false);
                            poseEndScreen.gameObject.SetActive(true);
                            sandbox.gameObject.SetActive(true);
                        }
                        break;
                    }

                    //If hand is missing, pause training
                    if (currentTrainingHand.handModel == null)
                    {
                        poseDescription.text = string.Format("{0} left. Pausing training.", (currentTrainingHand == rightHandRBF) ? "Right hand" : "Left hand");
                        poseTimer.color = Color.grey;
                    }
                    else
                    {
                        //Update calibration gui
                        poseTitle.text = HandPoseRBF.GetPoseName(m_currentTrainingPose);
                        poseTimer.color = Color.white;
                        string handText = (currentTrainingHand == rightHandRBF) ? "Right hand" : "Left hand";
                        poseDescription.text = string.Format("{0} {1} the target.", handText, HandPoseRBF.GetPoseName(m_currentTrainingPose));

                        //Update active calibration target
                        UpdateTrainingTargetColours(m_currentTrainingPose, m_currentTrainingPoseTest);
                        m_calibrationState = CalibrationState.WAITING_FOR_POSE;
                    }
                    break;
                case CalibrationState.WAITING_FOR_POSE:
                    if (currentTrainingHand.handModel == null)
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
                        m_currentCalibrationSamples.Clear();
                        poseTimer.color = Color.red;
                    }
                    break;
                case CalibrationState.CAPTURING_SAMPLES:
                    if (currentTrainingHand.handModel == null)
                    {
                        m_calibrationState = CalibrationState.POSE_SETUP;
                        m_currentPoseTime = poseCountdown;
                        break;
                    }

                    //Save current hand bone rotations
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

                        //Buffer training data for current pose
                        currentTrainingHand.SaveTrainingPoint(m_currentTrainingPose, m_calibrationAvg, true);
                        m_currentCalibrationSamples.Clear();

                        //Move onto the next training target
                        m_currentTrainingPoseTest++;
                        m_calibrationState = CalibrationState.POSE_SETUP;
                    }
                    break;
                case CalibrationState.CALIBRATED:
                    break;
            }
        }
    }
}
