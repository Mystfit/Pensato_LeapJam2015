using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Plug : MonoBehaviour {

    public enum PlugDirection { INPUT = 0, OUTPUT};
    public PlugDirection direction;

    //JACKS
    //----------------
    private HashSet<Plug> m_destinationPlugs;
    public void RegisterDestinationPlug(Plug plug){ m_destinationPlugs.Add(plug); }
    public void RemoveDestinationPlug(Plug plug) { m_destinationPlugs.Remove(plug); }
    public void UpdateJack(float value) { UpdateJack(new float[] { value }); }
    public void UpdateJack(float[] values)
    {
        foreach(Plug plug in m_destinationPlugs)
        {
            plug.Send(this, values);
        }
    }


    //PLUGS
    //------------------------
    private Dictionary<Plug, float[]> m_incomingJackValues;
    private HashSet<Plug> m_incomingJacks;
    public void Send(Plug jack, float[] values)
    {
        m_incomingJackValues[jack] = values;
        SetDirty();
    }


    void Awake()
    {
        m_incomingJacks = new HashSet<Plug>();
        m_destinationPlugs = new HashSet<Plug>();
        m_incomingJackValues = new Dictionary<Plug, float[]>();
    }

    private bool m_isDirty;
    private void SetDirty() { m_isDirty = true; }
    private void SetClean(){ m_isDirty = false;}
    public bool IsDirty{ get { return m_isDirty; }}
}
