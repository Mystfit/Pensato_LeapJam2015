using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PatchCable {

    public enum PlugType { PLUG = 0, JACK};
    public PlugType plugType;

    public PatchCable(PlugType plugType)
    {
        this.plugType = plugType;
        m_destinationPlugs = new HashSet<PatchCable>();
        m_incomingJacks = new HashSet<PatchCable>();
        m_incomingJackValues = new Dictionary<PatchCable, float[]>();
    }

    //JACKS
    //----------------
    private HashSet<PatchCable> m_destinationPlugs;
    public HashSet<PatchCable> connections
    {
        get
        {
            if(plugType == PlugType.JACK)
                return m_destinationPlugs;
            else if (plugType == PlugType.PLUG)
               return m_incomingJacks;
            return null;
        }
    }
    public int connectionCount {
        get {
            if (plugType == PlugType.JACK)
            {
                return m_destinationPlugs.Count;
            } else if (plugType == PlugType.PLUG)
            {
                return m_incomingJacks.Count;
            }
            return 0;
        }
    }
    public bool Connect(PatchCable plug){
        if (plugType == PlugType.JACK)
        {
            if(m_destinationPlugs.Add(plug))
                return plug.Connect(this);
        } 
        else if (plugType == PlugType.PLUG)
            if(m_incomingJacks.Add(plug))
                return plug.Connect(this);
        return false;
    }

    public void Disconnect(PatchCable plug) {
        if (plugType == PlugType.JACK)
            m_destinationPlugs.Remove(plug);
        else if (plugType == PlugType.PLUG)
            m_incomingJacks.Remove(plug);
    }
    public void UpdateJack(float value) { UpdateJack(new float[] { value }); }
    public void UpdateJack(float[] values)
    {
        foreach(PatchCable plug in m_destinationPlugs)
        {
            plug.Send(this, values);
        }
    }


    //PLUGS
    //------------------------
    private Dictionary<PatchCable, float[]> m_incomingJackValues;
    public Dictionary<PatchCable, float[]> values {get{ return m_incomingJackValues; } }
    public float[] jackValue(PatchCable jack) {
        if (values.ContainsKey(jack))
            return values[jack];
        return null;
    }

    private HashSet<PatchCable> m_incomingJacks;
    public void Send(PatchCable jack, float[] values)
    {
        m_incomingJackValues[jack] = values;
        SetDirty();
    }

    private bool m_isDirty;
    private void SetDirty() { m_isDirty = true; }
    private void SetClean(){ m_isDirty = false;}
    public bool IsDirty{ get { return m_isDirty; }}
}
