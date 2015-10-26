using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class LiveParameterProxyController : LiveProxyController<LiveParameterProxy>
{
    public LiveParameterProxy createParameter(LiveLink live, string id, string name, string parent, float min, float max, float startValue=0.0f)
    {
        Debug.Log("Building parameter: " + id.ToString());
        LiveParameterProxy parameter = createProxyUI(id.ToString());
        parameter.init(live, id, name, parent, min, max, startValue);
        return parameter;
    }

    public override void registerShowtimeListeners()
    {
        m_live.node.subscribeToMethod(m_live.peer.methods["param_updated"], param_updated);
    }

    private object param_updated(ZST.ZstMethod methodData)
    {
        LiveMessage msg = LiveLink.parseLiveMessage(methodData.output.ToString(), LiveLink.LiveMessageType.VALUE);
        LiveParameterProxy proxy = proxies[msg.id];
        if (proxy) queueIncomingAction(() => proxy.databinder.SetCurrentData((float)msg.payload));
        return null;
    }
}
