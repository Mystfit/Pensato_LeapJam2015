using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

public abstract class LiveProxy : MonoBehaviour{

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

    private LiveLink m_live;
    public LiveLink live
    {
        get { return m_live; }
    }

    public virtual void init(LiveLink live, string liveId, string name, string parentId)
    {
        proxyName = name;
        m_live = live;
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

    public abstract void update_value(object value);
    public abstract void receive_value(object value);

    private bool m_isCloneable;
    public bool isCloneable { get { return m_isCloneable; } set { m_isCloneable = value; } }
    public virtual LiveProxy clone(bool canCloneCopy = false){ return null; }
}
