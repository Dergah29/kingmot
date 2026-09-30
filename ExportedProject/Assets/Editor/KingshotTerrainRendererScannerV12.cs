using UnityEngine;
using UnityEditor;
using System.IO;
using System.Text;

public static class KingshotTerrainRendererScannerV12
{
    [MenuItem("Kingshot/Debug/V12 Scan Terrain And Environment Renderers")]
    public static void Scan()
    {
        var sb=new StringBuilder();
        sb.AppendLine("KINGSHOT TERRAIN / ENVIRONMENT RENDERER REPORT");
        sb.AppendLine();

        int count=0;
        foreach(Renderer r in Object.FindObjectsOfType<Renderer>(true))
        {
            string path=FullPath(r.transform);
            string low=path.ToLowerInvariant();

            if(!(low.Contains("/terrain") || low.Contains("/environment") ||
                 low.Contains("terrain_") || low.Contains("road")))
                continue;

            count++;
            sb.AppendLine("==================================================");
            sb.AppendLine("PATH: "+path);
            sb.AppendLine("TYPE: "+r.GetType().Name);
            sb.AppendLine("ENABLED: "+r.enabled);
            sb.AppendLine("BOUNDS CENTER: "+r.bounds.center);
            sb.AppendLine("BOUNDS SIZE: "+r.bounds.size);
            sb.AppendLine("MATERIALS: "+r.sharedMaterials.Length);

            for(int i=0;i<r.sharedMaterials.Length;i++) {
                Material m=r.sharedMaterials[i];
                if(!m) {
                    sb.AppendLine("  ["+i+"] NULL");
                    continue;
                }
                sb.AppendLine("  ["+i+"] "+m.name+
                    " | "+AssetDatabase.GetAssetPath(m)+
                    " | shader="+(m.shader?m.shader.name:"NULL"));
            }
            sb.AppendLine();
        }

        sb.Insert(0,"FOUND: "+count+"\n\n");
        string file="Assets/KingshotTerrainRendererReport.txt";
        File.WriteAllText(file,sb.ToString(),Encoding.UTF8);
        AssetDatabase.Refresh();

        Debug.Log("[Kingshot V12] report: "+file+" | renderers="+count);
        EditorUtility.DisplayDialog("Kingshot V12",
            "Report hazirdir:\n"+file+"\nRenderer: "+count,"OK");
    }

    static string FullPath(Transform t) {
        string s=t.name;
        while(t.parent!=null) { t=t.parent; s=t.name+"/"+s; }
        return s;
    }
}
