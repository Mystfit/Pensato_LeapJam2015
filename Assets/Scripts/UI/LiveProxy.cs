using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class LiveProxy : MonoBehaviour {

    protected HashSet<LiveProxy> m_children;
    protected bool m_isLayoutDirty = true;
    public bool isLayoutDirty() { return m_isLayoutDirty; }
    public void setLayoutDirty() { m_isLayoutDirty = true; }
    public void setLayoutClean() { m_isLayoutDirty = false; }

    private string m_id;
    public string id {
        set {m_id = value;}
        get { return m_id; }
    }

    private string m_name;
    public string proxyName
    {
        set { m_name = value; }
        get { return m_name; }
    }

    private string m_parentId;
    public string parentId
    {
        set { m_parentId = value; }
        get { return m_parentId; }
    }

    private LiveProxy m_parent;
    public LiveProxy parent
    {
        set { m_parent = value; }
        get { return m_parent; }
    }


    public virtual void init(string liveId, string name, string parentId)
    {
        //gameObject.name = name;
        proxyName = name;
        m_parentId = parentId;
        id = liveId;
    }

    public virtual bool AddChild(LiveProxy proxy)
    {
        setLayoutDirty();
        if (m_children == null) m_children = new HashSet<LiveProxy>();
        proxy.parent = this;
        return m_children.Add(proxy);
    }

    public virtual void RemoveChild(LiveProxy child)
    {
        m_children.Remove(child);
    }

    public virtual void Destroy()
    {
        if(parent != null)
        {
            parent.RemoveChild(this);
        }
        GameObject.Destroy(gameObject);
    }
}
