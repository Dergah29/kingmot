using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System.Collections.Generic;

public static class KingshotMaterialRepairV5
{
    const string ROOT = "AUTO_CITY_BUILDINGS";
    const string OUT = "Assets/KingshotRepairGeneratedV5";

    [MenuItem("Kingshot/City/V5/Repair Multi Texture Materials")]
    public static void Repair()
    {
        var root = GameObject.Find(ROOT);
        if (!root) { EditorUtility.DisplayDialog("Kingshot", ROOT+" tapilmadi.", "OK"); return; }

        EnsureFolder();
        Shader cartoon = Shader.Find("KingshotRepair/Cartoon");
        Shader transparent = Shader.Find("KingshotRepair/Transparent");
        if (!cartoon) { EditorUtility.DisplayDialog("Kingshot","KingshotRepair/Cartoon tapilmadi.","OK"); return; }

        var renderers = root.GetComponentsInChildren<Renderer>(true);
        var cache = new Dictionary<Material,Material>();
        int materials=0, textures=0;

        foreach (var r in renderers)
        {
            var arr = r.sharedMaterials;
            bool changed=false;
            for (int i=0;i<arr.Length;i++)
            {
                var src=arr[i];
                if (!src) continue;

                Material dst;
                if (!cache.TryGetValue(src,out dst))
                {
                    // If V4 material is currently assigned, try to trace its main texture,
                    // then search project materials for the original material with same base name.
                    var original = FindOriginal(src) ?? src;
                    Shader target = IsTransparent(original) && transparent ? transparent : cartoon;
                    dst = new Material(target);
                    dst.name = "V5_" + CleanName(original.name);

                    textures += CopyTextures(original,dst);
                    CopyColors(original,dst);
                    CopyFloats(original,dst);

                    string path=AssetDatabase.GenerateUniqueAssetPath(OUT+"/"+Safe(dst.name)+".mat");
                    AssetDatabase.CreateAsset(dst,path);
                    cache[src]=dst;
                    materials++;
                }
                arr[i]=dst; changed=true;
            }
            if(changed) {
                Undo.RecordObject(r,"Kingshot V5 material repair");
                r.sharedMaterials=arr;
                EditorUtility.SetDirty(r);
            }
        }

        AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        Debug.Log("[Kingshot V5] materials="+materials+", texture slots copied="+textures);
    }

    static Material FindOriginal(Material current)
    {
        string n=current.name;
        if(n.StartsWith("KR_")) n=n.Substring(3);
        if(n.StartsWith("V5_")) n=n.Substring(3);

        string[] ids=AssetDatabase.FindAssets(n+" t:Material");
        foreach(var id in ids) {
            string p=AssetDatabase.GUIDToAssetPath(id);
            if(p.StartsWith("Assets/KingshotRepairGenerated")) continue;
            var m=AssetDatabase.LoadAssetAtPath<Material>(p);
            if(m && (m.name==n || m.name.StartsWith(n))) return m;
        }
        return null;
    }

    static int CopyTextures(Material src, Material dst)
    {
        int copied=0;
        // Preserve each semantic map separately where the repair shader exposes it.
        string[] props={
            "_BaseMap","_MainTex","_MiddleMap","_ShadowMap","_MatCapMap",
            "_MaskMap","_MaskTex","_AlphaMap","_DetailMap","_EmissionMap"
        };

        foreach(string p in props) {
            if(!src.HasProperty(p)) continue;
            Texture t=src.GetTexture(p);
            if(!t) continue;

            // Base texture aliases.
            if(p=="_BaseMap" || p=="_MainTex") {
                if(dst.HasProperty("_BaseMap")) { dst.SetTexture("_BaseMap",t); copied++; }
                if(dst.HasProperty("_MainTex")) dst.SetTexture("_MainTex",t);
            } else if(dst.HasProperty(p)) {
                dst.SetTexture(p,t); copied++;
            }
        }

        // If no base texture was found, inspect every texture property and use
        // the first non-shadow/non-matcap texture as the base.
        if((!dst.HasProperty("_BaseMap") || dst.GetTexture("_BaseMap")==null) &&
           (!dst.HasProperty("_MainTex") || dst.GetTexture("_MainTex")==null)) {
            Shader s=src.shader;
            if(s) {
                int c=ShaderUtil.GetPropertyCount(s);
                for(int i=0;i<c;i++) {
                    if(ShaderUtil.GetPropertyType(s,i)!=ShaderUtil.ShaderPropertyType.TexEnv) continue;
                    string p=ShaderUtil.GetPropertyName(s,i);
                    Texture t=src.GetTexture(p);
                    if(!t) continue;
                    string low=p.ToLowerInvariant();
                    if(low.Contains("shadow") || low.Contains("matcap") || low.Contains("mask")) continue;
                    if(dst.HasProperty("_BaseMap")) dst.SetTexture("_BaseMap",t);
                    if(dst.HasProperty("_MainTex")) dst.SetTexture("_MainTex",t);
                    copied++; break;
                }
            }
        }
        return copied;
    }

    static void CopyColors(Material src, Material dst)
    {
        string[] ps={"_BaseColor","_Color","_TintColor"};
        foreach(string p in ps) if(src.HasProperty(p)) {
            Color c=src.GetColor(p);
            if(dst.HasProperty("_BaseColor")) dst.SetColor("_BaseColor",c);
            if(dst.HasProperty("_Color")) dst.SetColor("_Color",c);
            return;
        }
    }

    static void CopyFloats(Material src, Material dst)
    {
        string[] ps={"_Cutoff","_AlphaClip","_Glossiness","_Smoothness","_Metallic"};
        foreach(string p in ps)
            if(src.HasProperty(p) && dst.HasProperty(p)) dst.SetFloat(p,src.GetFloat(p));
    }

    static bool IsTransparent(Material m)
    {
        string n=(m.name+" "+(m.shader?m.shader.name:"")).ToLowerInvariant();
        return n.Contains("transparent") || n.Contains("alpha") ||
               n.Contains("glass") || n.Contains("fade");
    }

    static string CleanName(string n) {
        if(n.StartsWith("KR_")) n=n.Substring(3);
        return n;
    }

    static void EnsureFolder() {
        if(!AssetDatabase.IsValidFolder(OUT))
            AssetDatabase.CreateFolder("Assets","KingshotRepairGeneratedV5");
    }

    static string Safe(string s) {
        foreach(char c in System.IO.Path.GetInvalidFileNameChars()) s=s.Replace(c,'_');
        return s;
    }
}
