using UnityEngine;
using System.Collections;
using Newtonsoft.Json;

public class LiveUpdateRecord {
    [JsonProperty("id")]
    public string id { get; set; }

    [JsonProperty("name")]
    public string name { get; set; }
}
