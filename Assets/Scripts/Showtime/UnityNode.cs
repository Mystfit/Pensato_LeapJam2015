using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using ZST;
using UnityEngine;


public class UnityNode : MonoBehaviour
{
    public ZstNode node { get { return m_node; } }
    public bool connected = false;

    public bool useLocalhost = false;
    public bool isStage = false;
    public string stageAddress = null;
    public int stagePort;
    public string nodeName = "UnityNode";
    public string targetPeer;
    public ZstPeerLink peer;
    protected ZstNode m_node;

    public virtual void Awake()
    {
        //AsyncIO.ForceDotNet.Force();
        if (isStage)
        {
            m_node = new ZstNode(nodeName, stagePort);
        } else {        
            if(!String.IsNullOrEmpty(stageAddress))
                stageAddress = "tcp://" + stageAddress + ":" + stagePort.ToString();
            StartCoroutine("CreateNode");
        }
    }

    IEnumerator CreateNode()
    {
        if(String.IsNullOrEmpty(stageAddress))
            m_node = new ZstNode(nodeName);
        else
            m_node = new ZstNode(nodeName, stageAddress);

        //m_node.Start();
        yield return new WaitForSeconds(2);
        
        if (m_node.requestRegisterNode())
        {
            Debug.Log("Successfully registered to stage.");
            connected = true;
            Dictionary<string, ZstPeerLink> peers = m_node.requestNodePeerlinks();
            if (peers.ContainsKey(targetPeer))
            {
                peer = peers[targetPeer];
            }
        }
        else
        {
            Debug.Log("Stage did not respond.");
        }
        
        yield return null;
    }

    /*
     * Exit and cleanup
     */
    public void OnApplicationQuit()
    {
        Close();
    }

    public virtual void Close()
    {
        bool result = m_node.close();
        //Environment.Exit(Environment.ExitCode);
        Debug.Log("Network cleanup: " + result);
    }
}

