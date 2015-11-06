using UnityEngine;
using System.Collections;

public interface IHidable {
    void minimize();
    void maximize();
    bool isMinimized { get; }
}
