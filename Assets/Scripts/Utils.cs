using UnityEngine;
using System.Linq;
using System.Collections;
using Utils;

namespace Utils
{
    public static class ExtensionMethods
    {
        public static float Map(this float value, float fromSource, float toSource, float fromTarget, float toTarget)
        {
            return (value - fromSource) / (toSource - fromSource) * (toTarget - fromTarget) + fromTarget;
        }

    }
    public static class Helper 
    {
        public static GameObject FindInChildren(this GameObject go, string name)
        {
            return (from x in go.GetComponentsInChildren<Transform>()
                    where x.gameObject.name == name
                    select x.gameObject).First();
        }

        public static T FindComponentInParent<T>(this GameObject go)
        {
            if(go.transform.parent != null) return go.FindComponentInParent<T>();
            return default(T);
        }
    }

    public static class MidiTools
    {
        public static float midiIntToFloat(int midiValue){
            return Utils.MathTools.Clamp( ((float)midiValue / 127.0f), 0.0f, 1.0f);
        }
        
        public static int floatToMidiInt(float fValue){
            return Utils.MathTools.Clamp( (int)(fValue * 127), 0, 127);
        }
    }

    public static class MathTools
    {
        public static float Scale(float value, float min, float max){
        return (value - min) / (max - min);
        }
                
        public static int Clamp(int value, int min, int max)  
        {  
            return (value < min) ? min : (value > max) ? max : value;  
        }
    
        public static float Clamp(float value, float min, float max)  
        {  
            return (value < min) ? min : (value > max) ? max : value;  
        }
    
        public static float Remap (float value, float from1, float to1, float from2, float to2) {
            return (value - from1) / (to1 - from1) * (to2 - from2) + from2;
        }
    }

    public static class ColorTools
    {
        public static string intToHex(int input){
            return input.ToString("X");
        }
    
        public static UnityEngine.Color intToColor(int input){
            return new UnityEngine.Color( (float)((input >> 16) & 255) / 255, (float)((input >> 8) & 255) / 255, (float)((input) & 255) / 255 );
        }
    }
}