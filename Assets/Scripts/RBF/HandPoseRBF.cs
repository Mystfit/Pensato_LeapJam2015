using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using RBF;
using System;

public class HandPoseRBF : MonoBehaviour
{
    //Calibration state
    public enum Hand { LEFT = 0, RIGHT };
    public Hand m_hand;
    protected HandModel m_handModel;

    //RBF
    private RBFCore m_rbf;
    public RBFCore RBF { get { return m_rbf; } }
    public double m_sigma = 0.5;
    public string trainingFilePath = "";

    //Gestures
    public static string UNRECOGNIZED_GESTURE = "UNRECOGNIZED";
    public string[] m_gestures;
    private int m_currentGesture;
    private int m_lastGesture;
    private int m_lastGestureDown;
    private int m_currentGestureTimer = 0;
    private double m_confidence;
    private int m_activeGesture;
    private int m_activeGestureDown;
    private bool m_isDirty = true;
    public bool m_loadRbfFromFile = false;
    public double gestureThreshold = 0.7;

    //Gesture change speeds
    private double[] m_lastGestureOutput;
    private double[] m_gestureVelocity;
    public double activeGestureVelocity;
    public int m_gestureSwitchDelay = 0;

    //Training events
    public delegate void PoseCompleteEventHandler(int index);
    public event PoseCompleteEventHandler onGestureCalibrated;
    public event PoseCompleteEventHandler onTrainingPointSaved;

    public bool isTrained;

    public void Init(string[] gestures)
    {
        m_gestures = gestures;
        m_rbf = new RBFCore(5 * FingerModel.NUM_BONES * 4, m_gestures.Length);
        m_rbf.setSigma(m_sigma);
        m_gestureVelocity = new double[m_gestures.Length];
        m_lastGestureOutput = new double[m_gestures.Length];

        //Load cached RBF glove values
        if (m_loadRbfFromFile)
            LoadRBF();
    }

    public HandModel handModel { set {
            if(value == null)
            {
                Debug.Log("Hand leaving");
            }
            m_handModel = value;}
        get { return m_handModel; } }

    public void EndTraining()
    {
        m_rbf.calculateWeights();
        isTrained = true;
        Debug.Log("Calibration complete!");
    }

    public void SaveRBF()
    {
        SaveRBF(trainingFilePath);
    }

    public void SaveRBF(string path)
    {
        if (path != String.Empty)
            m_rbf.SaveRBF(path);
    }

    public bool LoadRBF()
    {
        return LoadRBF(trainingFilePath);
    }

    public bool LoadRBF(string path)
    {
        if (path != String.Empty)
        {
            if (m_rbf.LoadRBF(path))
            {
                isTrained = true;
                return true;
            }
        }
        return false;
    }


    /// <summary>
    /// Grab hand bone quaternion components and combine into a flat array for the RBF
    /// </summary>
    /// <returns></returns>
    public double[] GetFlatBoneRotations()
    {
        double[] boneRotations = new double[m_rbf.numInputs];
        int rowLength = m_handModel.fingers.Length * FingerModel.NUM_BONES * 4;
        for (int finger = 0; finger < m_handModel.fingers.Length; finger++)
        {
            for (int bone = 0; bone < FingerModel.NUM_BONES; bone++)
            {
                Quaternion rot = Quaternion.Inverse((bone == 0) ? m_handModel.GetPalmRotation() : m_handModel.fingers[finger].GetBoneRotation(bone - 1)) * m_handModel.fingers[finger].GetBoneRotation(bone);
                boneRotations[(finger * FingerModel.NUM_BONES * 4) + (bone * 4)] = rot.w;
                boneRotations[(finger * FingerModel.NUM_BONES * 4) + (bone * 4) + 1] = rot.x;
                boneRotations[(finger * FingerModel.NUM_BONES * 4) + (bone * 4) + 2] = rot.y;
                boneRotations[(finger * FingerModel.NUM_BONES * 4) + (bone * 4) + 3] = rot.z;
            }
        }
        return boneRotations;
    }

    /// <summary>
    /// Save pose training data to the RBF
    /// </summary>
    public void SaveTrainingPoint(int gesture, double[] trainingData)
    {
        //Samples recorded, save into RBF engine.
        m_rbf.addTrainingPoint(trainingData, BuildRBFGestureOuput(gesture));
        //onTrainingPointSaved(gesture);
    }
    
    /// <summary>
    /// Calculate the active gesture against trained poses
    /// </summary>
    private void InterpolateGestures()
    {
        double[] gestureOutput = m_rbf.calculateOutput(GetFlatBoneRotations());

        //Calculate gesture change velocities
        string gestureDump = "";
        for (int i = 0; i < m_gestures.Length; i++)
        {
            gestureDump += string.Format("{0}:{1} ", m_gestures[i], gestureOutput[i]);
            m_gestureVelocity[i] = gestureOutput[i] - m_lastGestureOutput[i];
            if (m_gestureVelocity[i] < 0) m_gestureVelocity[i] *= -1.0;
        }
 
        m_lastGestureOutput = gestureOutput;

        //Find current gesture
        double largestVal = 0.0;
        int activeIndex = 0;
        for (int i = 0; i < gestureOutput.Length; i++)
        {
            if (gestureOutput[i] > largestVal)
            {
                largestVal = gestureOutput[i];
                activeIndex = i;
            }
        }

        if(largestVal > gestureThreshold && gestureThreshold > 0.0)
        {
            m_currentGesture = activeIndex;
            m_confidence = largestVal;
            Debug.Log(string.Format("{0} | Active: {1}", gestureDump, m_gestures[activeIndex]));
        }
        else
        {
            Debug.Log("No recognized gestures");
            m_currentGesture = -1;
        }


        //Delay the reported gesture change by a frame count to let the RBF settle
        if (m_currentGesture != m_lastGesture)
            m_currentGestureTimer = 0;
        else
            m_currentGestureTimer++;

        if (m_currentGestureTimer > m_gestureSwitchDelay)
        {
            m_activeGesture = m_currentGesture;

            if (m_activeGesture != m_lastGestureDown)
            {
                m_activeGestureDown = m_activeGesture;
                activeGestureVelocity = m_gestureVelocity[activeIndex];
                SetDirty();
            }
            else
            {
                m_activeGestureDown = -1;
                SetClean();
            }

            m_lastGestureDown = m_currentGesture;
        }

        m_lastGesture = m_currentGesture;
    }

    void Update()
    {
        if (handModel != null && isTrained)
        {
            InterpolateGestures();
        }
    }


    /*
     * Getters
     */
    public string activeGesture { get { return (m_activeGesture > -1) ? gestures[m_activeGesture] : UNRECOGNIZED_GESTURE; } }
    public double confidence { get { return Math.Round(m_confidence, 2); } }
    public string[] gestures { get { return m_gestures; } }
    public bool GetGestureDown(string gesture)
    {
        if (gestures[m_activeGestureDown] == gesture && m_activeGestureDown > -1)
            return true;
        return false;
    }
    public double[] GetRawGestures()
    {
        return m_lastGestureOutput;
    }

    public string GetGestureName(int index)
    {
        if (index < m_gestures.Length && index > -1)
            return m_gestures[index];
        return UNRECOGNIZED_GESTURE;
    }

    /*
     * GestureState notifiers
     */
    private void SetDirty() { m_isDirty = true; }
    private void SetClean() { m_isDirty = false; }
    public bool IsGestureClean() { return m_isDirty; }

    /*
     * Gets an array with the chosen gesture index set to 1.0. Used for finger RBF gesture matching
     */
    protected double[] BuildRBFGestureOuput(int gestureIndex)
    {
        double[] calibrationArr = new double[m_gestures.Length];
        calibrationArr[gestureIndex] = 1.0;
        return calibrationArr;
    }
}