using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System.Collections.Generic;

public static class KingshotWhiteTextureRepairV4
{
    const string ROOT="AUTO_CITY_BUILDINGS";

    static readonly string[] TextureProps = {
        "_BaseMap","_MainTex","_Albedo","_AlbedoMap","_Diffuse",
        "_DiffuseMap","_BaseColorMap","_ColorMap","_MiddleMap"
    };

    [MenuItem("Kingshot/City/V4/Repair White Building Textures")]
    public static void Repair()
    {
        GameObject root=GameObject.Find(ROOT);
        if(root==null) {
            EditorUtility.DisplayDialog("Kingshot",ROOT+" tapilmadi.","OK");
            return;
        }

        Shader cartoon=Shader.Find("KingshotRepair/Cartoon");
        if(cartoon==null) {
            EditorUtility.DisplayDialog("Kingshot","KingshotRepair/Cartoon tapilmadi.","OK");
            return;
        }

        Renderer[] rs=root.GetComponentsInChildren<Renderer>(true);
        HashSet<Material> done=new HashSet<Material>();
        int fixedCount=0, textureCount=0;

        foreach(Renderer r in rs) {
            foreach(Material m in r.sharedMaterials) {
                if(m==null || !done.Add(m)) continue;

                Texture tex=FindTexture(m);
                Color col=FindColor(m);

                // Do not destroy original material assets:
                // create a local repaired copy and assign it only to this renderer below.
                // The actual per-renderer copy is handled after this scan.
            }
        }

        // Replace materials per renderer with repaired copies saved under Assets/KingshotRepairGenerated.
        const string folder="Assets/KingshotRepairGenerated";
        if(!AssetDatabase.IsValidFolder(folder))
            AssetDatabase.CreateFolder("Assets","KingshotRepairGenerated");

        Dictionary<Material,Material> map=new Dictionary<Material,Material>();

        foreach(Renderer r in rs) {
            Material[] mats=r.sharedMaterials;
            bool changed=false;

            for(int i=0;i<mats.Length;i++) {
                Material src=mats[i];
                if(src==null) continue;

                Material dst;
                if(!map.TryGetValue(src,out dst)) {
                    Texture tex=FindTexture(src);
                    Color col=FindColor(src);

                    dst=new Material(cartoon);
                    dst.name="KR_"+src.name;

                    if(tex!=null) {
                        if(dst.HasProperty("_BaseMap")) dst.SetTexture("_BaseMap",tex);
                        if(dst.HasProperty("_MainTex")) dst.SetTexture("_MainTex",tex);
                        textureCount++;
                    }
                    if(dst.HasProperty("_BaseColor")) dst.SetColor("_BaseColor",col);
                    if(dst.HasProperty("_Color")) dst.SetColor("_Color",col);

                    string path=AssetDatabase.GenerateUniqueAssetPath(
                        folder+"/"+Safe(dst.name)+".mat");
                    AssetDatabase.CreateAsset(dst,path);
                    map[src]=dst;
                    fixedCount++;
                }

                mats[i]=dst;
                changed=true;
            }

            if(changed) {
                Undo.RecordObject(r,"Repair white Kingshot textures");
                r.sharedMaterials=mats;
                EditorUtility.SetDirty(r);
            }
        }

        AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        Debug.Log("[Kingshot V4] repaired material copies="+fixedCount+
                  ", textures recovered="+textureCount+
                  ". Original material assets were not modified.");
    }

    static Texture FindTexture(Material m) {
        foreach(string p in TextureProps) {
            if(m.HasProperty(p)) {
                Texture t=m.GetTexture(p);
                if(t!=null) return t;
            }
        }

        // Fallback: inspect every texture property exposed by the original shader.
        Shader s=m.shader;
        if(s!=null) {
            int count=ShaderUtil.GetPropertyCount(s);
            for(int i=0;i<count;i++) {
                if(ShaderUtil.GetPropertyType(s,i)!=ShaderUtil.ShaderPropertyType.TexEnv) continue;
                string p=ShaderUtil.GetPropertyName(s,i);
                if(m.HasProperty(p)) {
                    Texture t=m.GetTexture(p);
                    if(t!=null) return t;
                }
            }
        }
        return null;
    }

    static Color FindColor(Material m) {
        string[] ps={"_BaseColor","_Color","_TintColor"};
        foreach(string p in ps)
            if(m.HasProperty(p)) return m.GetColor(p);
        return Color.white;
    }

    static string Safe(string s) {
        foreach(char c in System.IO.Path.GetInvalidFileNameChars())
            s=s.Replace(c,'_');
        return s;
    }
}
