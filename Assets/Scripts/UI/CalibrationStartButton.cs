using UnityEngine;
using System.Collections;

public class CalibrationStartButton : MomentaryButton {
    public HandPoseTrainingController poseController;

    public override void ButtonTurnsOn()
    {
        if(poseController != null)
        {
            poseController.StartTraining();
        }
        base.ButtonTurnsOn();
    }
}
