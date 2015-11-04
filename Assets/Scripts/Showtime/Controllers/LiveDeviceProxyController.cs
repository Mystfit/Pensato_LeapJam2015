using UnityEngine;
using System.Collections;
using System.Linq;

public class LiveDeviceProxyController : LiveProxyController<LiveDeviceProxy>
{
    public Transform vr_eye;
  
    public LiveDeviceProxy createDevice(LiveLink live, string id, string name, string parent)
    {
        Debug.Log("Building device: " + id.ToString());
        LiveDeviceProxy device = createProxyUI(id.ToString());
        device.init(live, id, name, parent);
        return device;
    }

    public LiveProxy focusedLookDevice()
    {
        if (proxies.Count == 1)
            return proxies.Values.First();
                
        float smallestAngle = -1.0f;
        LiveProxy closestLookTarget = null;

        foreach(LiveProxy proxy in proxies.Values)
        {
            if (proxy.isActiveAndEnabled)
            {
                float angle = Vector3.Angle(vr_eye.forward, proxy.transform.position - vr_eye.position);

                if (smallestAngle < 0.0f)
                    smallestAngle = angle;

                if (angle <= smallestAngle)
                {
                    smallestAngle = angle;
                    closestLookTarget = proxy;
                }
            }
        }
        return closestLookTarget;
    }
}
