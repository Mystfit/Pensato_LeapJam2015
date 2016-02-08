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

    //Gestures
    public string[] m_gestures;
    private string m_currentGesture;
    private string m_lastGesture;
    private string m_lastGestureDown;
    private int m_currentGestureTimer = 0;
    public string m_activeGesture;
    private string m_activeGestureDown;
    private bool m_isDirty = true;
    public string m_rbfFilePath = "";
    public bool m_loadRbfFromFile = false;

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

    public bool LoadRBF()
    {
        if (m_rbfFilePath != String.Empty)
        {
            if (m_rbf.LoadRBF(m_rbfFilePath))
            {
                Debug.Log("Glove RBF loaded from file");
                isTrained = true;
                return true;
            }
        }
        return false;
    }

    public void EndTraining()
    {
        m_rbf.calculateWeights();
        isTrained = true;
        Debug.Log("Calibration complete!");
    }

    public void SaveRBF()
    {
        if (m_rbfFilePath != String.Empty)
            m_rbf.SaveRBF(m_rbfFilePath);
    }


    /// <summary>
    /// Grab hand bone quaternion components and combine into a flat array for the RBF
    /// </summary>
    /// <returns></returns>
    public double[] GetFlatBoneRotations()
    {
        double[] boneRotations = new double[m_rbf.numInputs];
        int rowLength = m_handModel.fingers.Length * FingerModel.NUM_BONES * 4;
        for (int i = 0; i < m_handModel.fingers.Length; i++)
        {
            for (int j = 0; j < FingerModel.NUM_BONES; j++)
            {
                Quaternion rot = Quaternion.Inverse(m_handModel.GetPalmRotation()) * m_handModel.fingers[i].GetBoneRotation(j);
                boneRotations[(i * FingerModel.NUM_BONES * 4) + (j * 4)] = rot.w;
                boneRotations[(i * FingerModel.NUM_BONES * 4) + (j * 4) + 1] = rot.x;
                boneRotations[(i * FingerModel.NUM_BONES * 4) + (j * 4) + 2] = rot.y;
                boneRotations[(i * FingerModel.NUM_BONES * 4) + (j * 4) + 3] = rot.z;
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

        m_currentGesture = m_gestures[activeIndex];
        Debug.Log(string.Format("{0} | Active: {1}", gestureDump, m_gestures[activeIndex]));

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
                //SetCollider(activeIndex);
            }
            else
            {
                m_activeGestureDown = "";
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
    public string activeGesture { get { return m_activeGesture; } }
    public string[] gestureTypes { get { return m_gestures; } }
    public bool GetGestureDown(string gesture)
    {
        if (m_activeGestureDown == gesture && m_activeGestureDown != "")
            return true;
        return false;
    }
    public double[] GetRawGestures()
    {
        return m_lastGestureOutput;
    }

    public string GetGestureName(int index)
    {
        if (index < m_gestures.Length)
            return m_gestures[index];
        return null;
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