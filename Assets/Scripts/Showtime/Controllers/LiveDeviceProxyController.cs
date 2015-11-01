using UnityEngine;
using System.Collections;

public class LiveDeviceProxyController : LiveProxyController<LiveDeviceProxy>
{
    public LiveDeviceProxy createDevice(LiveLink live, string id, string name, string parent)
    {
        Debug.Log("Building device: " + id.ToString());
        LiveDeviceProxy device = createProxyUI(id.ToString());
        device.init(live, id, name, parent);
        return device;
    }
}
