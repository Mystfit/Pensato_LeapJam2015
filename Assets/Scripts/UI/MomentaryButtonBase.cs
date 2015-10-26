using UnityEngine;
using System.Collections;
using System;

namespace LMWidgets
{
    public abstract class MomentaryButtonBase : ButtonBase, BinaryInteractionHandler<bool>, IDataBoundWidget<MomentaryButtonBase, bool>
    {
        protected DataBinderMomentary m_dataBinder;

        public abstract void ButtonTurnsOn();
        public abstract void ButtonTurnsOff();

        protected override void Start()
        {
            if (m_dataBinder != null)
            {
                setButtonState(m_dataBinder.GetCurrentData(), true); // Initilize widget value
            }
            else
            {
                setButtonState(false, true);
            }
        }

        public void SetWidgetValue(bool value)
        {
            if (State == LeapPhysicsState.Interacting) { return; } // Don't worry about state changes during interaction.
            setButtonState(value);
        }

        // Stop listening to any previous data binder and start listening to the new one.
        public void RegisterDataBinder(LMWidgets.DataBinder<LMWidgets.MomentaryButtonBase, bool> dataBinder)
        {
            if (dataBinder == null)
            {
                return;
            }

            UnregisterDataBinder();
            m_dataBinder = dataBinder as DataBinderMomentary;
            setButtonState(m_dataBinder.GetCurrentData());
        }

        // Stop listening to any previous data binder.
        public void UnregisterDataBinder()
        {
            m_dataBinder = null;
        }

        public void setButtonState(bool state, bool force = false)
        {
            if(state)
                ButtonTurnsOn();
            else
                ButtonTurnsOff();
        }

        protected override void buttonReleased()
        {
            if (m_dataBinder != null) setButtonState(m_dataBinder.GetCurrentData()); // Update once we're done interacting
            setButtonState(false);
            base.FireButtonEnd();
        }

        protected override void buttonPressed()
        {
            ButtonTurnsOn();
            if (m_dataBinder != null) m_dataBinder.SetCurrentData(true);  // Update externally linked data
            setButtonState(true);
            base.FireButtonStart();
        }

    }
    public abstract class DataBinderMomentary : DataBinder<MomentaryButtonBase, bool> { };

}
