using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using RBF;
using System.Linq;
using System;

namespace HandPoses
{
    public class HandPoseRBF : MonoBehaviour
    {
        // Poses
        public enum PoseType { UNRECOGNIZED = -1, NEUTRAL = 0, GRASP, PINCH_INDEX, PINCH_MID, PINCH_RING, PINCH_PINKY };
        public enum PoseCategory { NEUTRAL = 0, GRASP, PINCH };
        private Dictionary<PoseType, PoseCategory> m_poseCategoryLookup = new Dictionary<PoseType, PoseCategory>()
        {
            { PoseType.NEUTRAL, PoseCategory.NEUTRAL },
            { PoseType.GRASP, PoseCategory.GRASP },
            { PoseType.PINCH_INDEX, PoseCategory.PINCH },
            { PoseType.PINCH_MID, PoseCategory.PINCH },
            { PoseType.PINCH_RING, PoseCategory.PINCH },
            { PoseType.PINCH_PINKY, PoseCategory.PINCH }
        };
        public static string GetPoseName(PoseType pose) { return Enum.GetName(typeof(PoseType), pose); }
        public static string[] allPoseNames { get { return Enum.GetNames(typeof(PoseType)); } }
        public static string[] validPoseNames { get { return Enum.GetNames(typeof(PoseType)).Cast<string>().Where(p => p != GetPoseName(PoseType.UNRECOGNIZED) ).ToArray(); } }

        private PoseType m_activePose;
        public PoseType activePose { get { return m_activePose; } }
        private PoseType m_activePoseDown;
        public bool GetPoseDown(PoseType pose) { return (m_activePoseDown == pose && m_activePoseDown > PoseType.UNRECOGNIZED) ? true : false; }
        private PoseType m_currentPose;
        private PoseType m_lastPose;
        private PoseType m_lastPoseDown;

        private int m_currentPoseTimer = 0;
        private double m_poseConfidence;
        public double poseConfidence { get { return Math.Round(m_poseConfidence, 2); } }
        public double poseThreshold = 0.7;

        //Leap handmodel
        public enum Hand { LEFT = 0, RIGHT };
        protected HandModel m_handModel;
        public HandModel handModel { set { m_handModel = value; } get { return m_handModel; } }

        //RBF
        private RBFCore m_rbf;
        public RBFCore RBF { get { return m_rbf; } }
        public double m_sigma = 0.5;
        public string trainingFilePath = "";
        public bool m_loadRbfFromFile = false;

        //Dirty states
        private bool m_isDirty = true;
        private void SetDirty() { m_isDirty = true; }
        private void SetClean() { m_isDirty = false; }
        public bool IsPoseClean() { return m_isDirty; }

        //Pose change speeds
        private double[] m_lastPoseOutput;
        public double[] GetRawPose() { return m_lastPoseOutput; }
        private double[] m_poseVelocity;
        public double activePoseVelocity;
        public int m_poseSwitchDelay = 0;

        //Training events
        public delegate void PoseCompleteEventHandler(int index);
        public event PoseCompleteEventHandler onPoseCalibrated;
        public event PoseCompleteEventHandler onTrainingPointSaved;

        private List<double[]>[] m_bufferedTraining;
        public bool isTrained;


        void Start()
        {
            m_rbf = new RBFCore(5 * FingerModel.NUM_BONES * 4, validPoseNames.Length);
            m_rbf.setSigma(m_sigma);
            m_poseVelocity = new double[validPoseNames.Length];
            m_lastPoseOutput = new double[validPoseNames.Length];
            m_bufferedTraining = new List<double[]>[HandPoseRBF.validPoseNames.Length];
            for (int i = 0; i < m_bufferedTraining.Length; i++) m_bufferedTraining[i] = new List<double[]>();

            if (m_loadRbfFromFile)
                LoadRBF();
        }

        void Update()
        {
            if (handModel != null && isTrained)
            {
                InterpolatePoses();
            }
        }

        /// <summary>
        /// End RBF training
        /// </summary>
        public void EndTraining()
        {
            SaveBufferedTraining();
            m_rbf.calculateWeights();
            isTrained = true;
            Debug.Log("Calibration complete!");
        }


        /// <summary>
        /// Save RBF to file
        /// </summary>
        public void SaveRBF()
        {
            SaveRBF(trainingFilePath);
        }


        /// <summary>
        /// Save RBF to file path
        /// </summary>
        /// <param name="path">Path to save RBF training to</param>
        public void SaveRBF(string path)
        {
            if (path != String.Empty)
                m_rbf.SaveRBF(path);
        }

        /// <summary>
        /// Load RBF training from file
        /// </summary>
        /// <returns>Load successful</returns>
        public bool LoadRBF()
        {
            return LoadRBF(trainingFilePath);
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="path">Path to load RBF from</param>
        /// <returns>Load succesful</returns>
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
        /// Save training pose data
        /// </summary>
        /// <param name="pose">Pose index</param>
        /// <param name="trainingData">double[] of training data</param>
        public void SaveTrainingPoint(PoseType pose, double[] trainingData)
        {
            SaveTrainingPoint(pose, trainingData, false);
        }


        /// <summary>
        /// Save training pose data
        /// </summary>
        /// <param name="pose">Pose index</param>
        /// <param name="trainingData">double[] of training data</param>
        /// <param name="buffer">Save training data to buffer instead</param>
        public void SaveTrainingPoint(PoseType pose, double[] trainingData, bool buffer)
        {
            if(buffer)
                m_bufferedTraining[(int)pose].Add(trainingData);
            else
                m_rbf.addTrainingPoint(trainingData, BuildRBFPoseOuput((HandPoseRBF.PoseType)pose));
        }

        /// <summary>
        /// Commit buffered training data to RBF
        /// </summary>
        private void SaveBufferedTraining()
        {
            for (int pose = 0; pose < HandPoseRBF.validPoseNames.Length; pose++)
                foreach (double[] trainingData in m_bufferedTraining[pose])
                    m_rbf.addTrainingPoint(trainingData, BuildRBFPoseOuput((HandPoseRBF.PoseType)pose));

            //Clear buffered training data when we're done
            m_bufferedTraining = new List<double[]>[HandPoseRBF.validPoseNames.Length];
        }

        /// <summary>
        /// Calculate the active pose against trained poses
        /// </summary>
        private void InterpolatePoses()
        {
            double[] poseRBFOutput = m_rbf.calculateOutput(GetFlatBoneRotations());

            //Calculate pose change velocities
            for (int i = 0; i < validPoseNames.Length; i++)
            {
                m_poseVelocity[i] = poseRBFOutput[i] - m_lastPoseOutput[i];
                if (m_poseVelocity[i] < 0) m_poseVelocity[i] *= -1.0;
            }

            m_lastPoseOutput = poseRBFOutput;

            //Find current pose
            double largestVal = 0.0;
            PoseType activePose = 0;
            for (int i = 0; i < poseRBFOutput.Length; i++)
            {
                if (poseRBFOutput[i] > largestVal)
                {
                    largestVal = poseRBFOutput[i];
                    activePose = (PoseType)i;
                }
            }

            if (largestVal > poseThreshold && poseThreshold > 0.0)
            {
                m_currentPose = (PoseType)activePose;
                m_poseConfidence = largestVal;
            }
            else
            {
                m_currentPose = PoseType.UNRECOGNIZED;
            }


            //Delay the reported pose change by a frame count to let the RBF settle
            if (m_currentPose != m_lastPose)
                m_currentPoseTimer = 0;
            else
                m_currentPoseTimer++;

            if (m_currentPoseTimer > m_poseSwitchDelay)
            {
                m_activePose = m_currentPose;

                if (m_activePose != m_lastPoseDown)
                {
                    m_activePoseDown = m_activePose;
                    activePoseVelocity = m_poseVelocity[(int)activePose];
                    SetDirty();
                }
                else
                {
                    m_activePoseDown = PoseType.UNRECOGNIZED;
                    SetClean();
                }

                m_lastPoseDown = m_currentPose;
            }

            m_lastPose = m_currentPose;
        }


        /// <summary>
        /// Gets an array with the chosen pose index set to 1.0
        /// </summary>
        /// <param name="pose">Pose to generate RBF output for</param>
        /// <returns>Generated Pose RBF output array</returns>
        protected double[] BuildRBFPoseOuput(PoseType pose)
        {
            if (pose == PoseType.UNRECOGNIZED)
                throw new IndexOutOfRangeException("Can't build an UNRECOGNIZED pose!");
            double[] calibrationArr = new double[validPoseNames.Length];
            calibrationArr[(int)pose] = 1.0;
            return calibrationArr;
        }
    }
}