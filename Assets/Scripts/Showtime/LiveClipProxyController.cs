using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

public class LiveClipProxyController : LiveProxyController<LiveClipProxy>
{
    public LiveClipProxy createClip(LiveLink live, string id, string name, string parent)
    {
        Debug.Log("Building clip: " + id.ToString());
        LiveClipProxy clip = createProxyUI(id.ToString());
        clip.init(live, id, name, parent);
        return clip;
    }

    public override void registerShowtimeListeners()
    {
        m_live.node.subscribeToMethod(m_live.peer.methods["clip_status"], clip_status);
    }

    private object clip_status(ZST.ZstMethod methodData)
    {
        LiveMessage msg = LiveLink.parseLiveMessage(methodData.output.ToString(), LiveLink.LiveMessageType.OBJECT);

        LiveClipProxy proxy = proxies[msg.id];
        if (proxy)
        {
            if ((bool)msg.dict["triggered"])
            {
                Debug.Log("Clip is triggered");
            } else if ((bool)msg.dict["playing"])
            {
                Debug.Log("Clip is playing");
            }
        }

        return null;
    }
}
