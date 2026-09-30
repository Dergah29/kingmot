using UnityEngine;
using UnityEditor;
using System.Text;
using System.IO;
using System.Collections.Generic;

public static class KingshotMaterialInspector
{
    [MenuItem("Kingshot/Debug/Inspect Selected Building Materials")]
    public static void Inspect()
    {
        GameObject go=Selection.activeGameObject;
        if(!go) {
            EditorUtility.DisplayDialog("Kingshot","Scene-de ag qalan binani sec.","OK");
            return;
        }

        var sb=new StringBuilder();
        sb.AppendLine("KINGSHOT SELECTED BUILDING MATERIAL REPORT");
        sb.AppendLine("Selected: "+FullPath(go.transform));
        sb.AppendLine();

        Renderer[] rs=go.GetComponentsInChildren<Renderer>(true);
        sb.AppendLine("Renderers: "+rs.Length);
        sb.AppendLine();

        int ri=0;
        foreach(Renderer r in rs) {
            sb.AppendLine("==================================================");
            sb.AppendLine("RENDERER "+(++ri));
            sb.AppendLine("Object: "+FullPath(r.transform));
            sb.AppendLine("Type: "+r.GetType().Name);
            sb.AppendLine("Enabled: "+r.enabled);
            sb.AppendLine("Materials: "+r.sharedMaterials.Length);

            for(int mi=0;mi<r.sharedMaterials.Length;mi++) {
                Material m=r.sharedMaterials[mi];
                sb.AppendLine();
                sb.AppendLine("  MATERIAL ["+mi+"]");
                if(!m) { sb.AppendLine("  NULL"); continue; }

                sb.AppendLine("  Name: "+m.name);
                sb.AppendLine("  Asset: "+AssetDatabase.GetAssetPath(m));
                sb.AppendLine("  Shader: "+(m.shader ? m.shader.name : "NULL"));

                if(!m.shader) continue;
                int pc=ShaderUtil.GetPropertyCount(m.shader);
                for(int pi=0;pi<pc;pi++) {
                    string p=ShaderUtil.GetPropertyName(m.shader,pi);
                    var type=ShaderUtil.GetPropertyType(m.shader,pi);
                    sb.Append("    "+p+" ["+type+"] = ");

                    try {
                        if(type==ShaderUtil.ShaderPropertyType.TexEnv) {
                            Texture t=m.GetTexture(p);
                            sb.Append(t ? t.name+" | "+AssetDatabase.GetAssetPath(t) : "NULL");
                            if(t) {
                                Vector2 sc=m.GetTextureScale(p);
                                Vector2 of=m.GetTextureOffset(p);
                                sb.Append(" | scale="+sc+" offset="+of);
                            }
                        } else if(type==ShaderUtil.ShaderPropertyType.Color) {
                            sb.Append(m.GetColor(p));
                        } else if(type==ShaderUtil.ShaderPropertyType.Vector) {
                            sb.Append(m.GetVector(p));
                        } else {
                            sb.Append(m.GetFloat(p));
                        }
                    } catch { sb.Append("<read error>"); }
                    sb.AppendLine();
                }
            }
            sb.AppendLine();
        }

        string path="Assets/KingshotSelectedMaterialReport.txt";
        File.WriteAllText(path,sb.ToString(),Encoding.UTF8);
        AssetDatabase.Refresh();
        Debug.Log("[Kingshot] Report written: "+path+" | Renderers="+rs.Length);
        EditorUtility.DisplayDialog("Kingshot","Report hazirdir:\n"+path,"OK");
    }

    static string FullPath(Transform t) {
        var parts=new List<string>();
        while(t!=null) { parts.Add(t.name); t=t.parent; }
        parts.Reverse();
        return string.Join("/",parts);
    }
}
