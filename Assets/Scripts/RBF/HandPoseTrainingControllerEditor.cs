using UnityEngine;
using UnityEditor;
using System.Collections;

namespace HandPoses
{
    [CustomEditor(typeof(HandPoseTrainingController))]
    public class HandPoseTrainingControllerEditor : Editor
    {

        public override void OnInspectorGUI()
        {
            DrawDefaultInspector();
            HandPoseTrainingController controller = (HandPoseTrainingController)target;
            if (GUILayout.Button("Recalculate Weights"))
            {
                HandPoseRBF leftRBF = controller.leftHandRBF;
                HandPoseRBF rightRBF = controller.rightHandRBF;
                leftRBF.RBF.setSigma(controller.sigma);
                rightRBF.RBF.setSigma(controller.sigma);
            }
        }
    }
}