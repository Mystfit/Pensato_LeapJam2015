using UnityEngine;
using System.IO;
using Newtonsoft.Json;
using System.Collections;
using System.Collections.Generic;

[JsonObject(MemberSerialization.OptIn)]
public class GlobalConfigWrapper : MonoBehaviour
{
    public string m_configFile = "config.json";
    public bool m_useConfigFile = true;
    public bool m_buildConfigTemplate = false;

    private GlobalConfig m_config;

    void Awake()
    {
        m_config = new GlobalConfig();
        if (m_useConfigFile)
            m_config.LoadConfig(m_configFile);
    }

    void Update()
    {
        if (m_buildConfigTemplate)
        {
            m_buildConfigTemplate = false;
            m_config.WriteConfig(m_configFile);
        }
    }
}

public class GlobalConfig
{
    //Showtime
    [JsonProperty]
    public string ShowtimeStageAddress;
    [JsonProperty]
    public int ShowtimeStagePort;
    [JsonProperty]
    public bool ShowtimeUseBonjour;

    public static GlobalConfig m_instance;
    public static GlobalConfig Instance { get { return m_instance; } }

    public GlobalConfig()
    {
        if (m_instance == null)
            m_instance = this;
    }

    public void WriteConfig(string path)
    {
        StreamWriter writer = new StreamWriter(path);
        writer.WriteLine(JsonConvert.SerializeObject(this, Formatting.Indented));
        writer.Close();
    }

    public void LoadConfig(string path)
    {
        StreamReader reader = new StreamReader(path);
        string configStr = reader.ReadToEnd();
        GlobalConfig tempConfig = JsonConvert.DeserializeObject<GlobalConfig>(configStr);
        m_instance = tempConfig;
        reader.Close();
    }
}
