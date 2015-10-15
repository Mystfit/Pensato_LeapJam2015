using UnityEngine;
using System.Collections;

public class LiveParameterProxy : LiveProxy {

    private float m_min;
    public float min
    {
        set { m_min = value; }
        get { return m_min; }
    }

    private float m_max;
    public float max
    {
        set { m_max = value; }
        get { return m_max; }
    }

    public void init(string liveId, string name, string liveParent, float minimum, float maximum)
    {
        min = minimum;
        max = maximum;
        base.init(liveId, name, liveParent);
    }
}
