using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System.Collections.Generic;

public static class KingshotCartoonBuildV6
{
    const string ROOT="AUTO_CITY_BUILDINGS";
    const string OUT="Assets/KingshotRepairGeneratedV6";

    static readonly string[] BaseNames={
        "_BaseMap","_MainTex","_Albedo","_AlbedoMap","_DiffuseMap","_Diffuse"
    };

    [MenuItem("Kingshot/City/V6/Apply Cartoon Build Shader")]
    public static void Apply()
    {
        GameObject root=GameObject.Find(ROOT);
        if(!root) { EditorUtility.DisplayDialog("Kingshot",ROOT+" tapilmadi.","OK"); return; }

        Shader shader=Shader.Find("KingshotRepair/CartoonBuildV6");
        if(!shader) { EditorUtility.DisplayDialog("Kingshot","CartoonBuildV6 shader tapilmadi.","OK"); return; }

        EnsureFolder();

        Renderer[] renderers=root.GetComponentsInChildren<Renderer>(true);
        Dictionary<Material,Material> cache=new Dictionary<Material,Material>();
        int count=0, withBase=0;

        foreach(Renderer r in renderers)
        {
            Material[] a=r.sharedMaterials;
            bool changed=false;

            for(int i=0;i<a.Length;i++)
            {
                Material current=a[i];
                if(!current) continue;

                Material dst;
                if(!cache.TryGetValue(current,out dst))
                {
                    Material src=FindOriginal(current) ?? current;

                    Texture baseTex=GetFirst(src,BaseNames);
                    Texture middle=Get(src,"_MiddleMap");
                    Texture shadow=Get(src,"_ShadowMap");
                    Texture matcap=Get(src,"_MatCapMap");

                    dst=new Material(shader);
                    dst.name="V6_"+Strip(current.name);

                    if(baseTex) {
                        dst.SetTexture("_BaseMap",baseTex);
                        dst.SetTexture("_MainTex",baseTex);
                        withBase++;
                    }
                    if(middle) {
                        dst.SetTexture("_MiddleMap",middle);
                        // Original middle maps vary; keep conservative by default.
                        dst.SetFloat("_MiddleStrength",0.18f);
                    }
                    if(shadow) dst.SetTexture("_ShadowMap",shadow);
                    if(matcap) {
                        dst.SetTexture("_MatCapMap",matcap);
                        dst.SetFloat("_MatCapStrength",0.12f);
                    } else dst.SetFloat("_MatCapStrength",0f);

                    Color c=FindColor(src);
                    dst.SetColor("_Color",Color.white);
                    dst.SetColor("_BaseColor",c);

                    string path=AssetDatabase.GenerateUniqueAssetPath(
                        OUT+"/"+Safe(dst.name)+".mat");
                    AssetDatabase.CreateAsset(dst,path);
                    cache[current]=dst;
                    count++;
                }

                a[i]=dst;
                changed=true;
            }

            if(changed) {
                Undo.RecordObject(r,"Kingshot V6 Cartoon Build");
                r.sharedMaterials=a;
                EditorUtility.SetDirty(r);
            }
        }

        AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        Debug.Log("[Kingshot V6] materials="+count+", base textures="+withBase+
                  ". Only AUTO_CITY_BUILDINGS renderers changed.");
    }

    static Material FindOriginal(Material current)
    {
        string n=Strip(current.name);
        string[] ids=AssetDatabase.FindAssets(n+" t:Material");

        foreach(string id in ids) {
            string p=AssetDatabase.GUIDToAssetPath(id);
            if(p.Contains("KingshotRepairGenerated")) continue;
            Material m=AssetDatabase.LoadAssetAtPath<Material>(p);
            if(m && m.name==n) return m;
        }
        foreach(string id in ids) {
            string p=AssetDatabase.GUIDToAssetPath(id);
            if(p.Contains("KingshotRepairGenerated")) continue;
            Material m=AssetDatabase.LoadAssetAtPath<Material>(p);
            if(m) return m;
        }
        return null;
    }

    static string Strip(string n)
    {
        string[] prefixes={"V6_","V5_","KR_"};
        bool again=true;
        while(again) {
            again=false;
            foreach(string p in prefixes)
                if(n.StartsWith(p)) { n=n.Substring(p.Length); again=true; }
        }
        return n;
    }

    static Texture Get(Material m,string p) {
        return m && m.HasProperty(p) ? m.GetTexture(p) : null;
    }

    static Texture GetFirst(Material m,string[] names) {
        foreach(string p in names) {
            Texture t=Get(m,p);
            if(t) return t;
        }
        return null;
    }

    static Color FindColor(Material m) {
        if(m) {
            if(m.HasProperty("_BaseColor")) return m.GetColor("_BaseColor");
            if(m.HasProperty("_Color")) return m.GetColor("_Color");
        }
        return Color.white;
    }

    static void EnsureFolder() {
        if(!AssetDatabase.IsValidFolder(OUT))
            AssetDatabase.CreateFolder("Assets","KingshotRepairGeneratedV6");
    }

    static string Safe(string s) {
        foreach(char c in System.IO.Path.GetInvalidFileNameChars()) s=s.Replace(c,'_');
        return s;
    }
}
