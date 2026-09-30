using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

public class KingshotOriginalUIRegistryV17 : MonoBehaviour
{
    [Serializable] public class Entry {
        public string category;
        public string prefabName;
        public string assetPath;
    }
    public List<Entry> entries = new List<Entry>();
}

public static class KingshotAutoRestoreOriginalUIV17
{
    static readonly string[] Include = {
        "building","build","upgrade","construction","construct",
        "city","info","detail","level","accelerate","speedup"
    };

    static readonly string[] StrongUI = {
        "ui_","window","panel","popup","view","dialog","page","widget"
    };

    [MenuItem("Kingshot/City/V17/Auto Find And Restore Original Building UI")]
    public static void Run()
    {
        try {
            EditorUtility.DisplayProgressBar("Kingshot V17","APK-dan export olunan UI prefablar axtarilir...",0.05f);

            string[] guids = AssetDatabase.FindAssets("t:Prefab", new[]{"Assets"});
            var found = new List<(GameObject prefab,string path,int score,string category)>();

            for(int i=0;i<guids.Length;i++)
            {
                string path=AssetDatabase.GUIDToAssetPath(guids[i]);
                if(string.IsNullOrEmpty(path)) continue;
                string n=Path.GetFileNameWithoutExtension(path).ToLowerInvariant();
                string pl=path.ToLowerInvariant();

                int score=0;
                foreach(var k in Include) if(n.Contains(k)||pl.Contains("/"+k)) score+=2;
                foreach(var k in StrongUI) if(n.Contains(k)||pl.Contains(k)) score+=3;
                if(pl.Contains("/ui/")||pl.Contains("game_ui")||pl.Contains("prefab/ui")) score+=5;
                if(pl.Contains("building") && (pl.Contains("ui")||n.Contains("panel")||n.Contains("window"))) score+=6;
                if(score<5) continue;

                var prefab=AssetDatabase.LoadAssetAtPath<GameObject>(path);
                if(!prefab) continue;

                // UI candidates should actually contain Canvas/RectTransform or UI components.
                bool ui = prefab.GetComponent<RectTransform>() ||
                          prefab.GetComponentInChildren<Canvas>(true) ||
                          prefab.GetComponentsInChildren<RectTransform>(true).Length>2;
                if(!ui) continue;

                string cat = Category(n+" "+pl);
                found.Add((prefab,path,score,cat));

                if(i%300==0)
                    EditorUtility.DisplayProgressBar("Kingshot V17","UI prefablar analiz olunur...",(float)i/Mathf.Max(1,guids.Length));
            }

            found=found.OrderByDescending(x=>x.score).ThenBy(x=>x.path).ToList();

            GameObject uiRoot=GameObject.Find("KINGSHOT_ORIGINAL_UI");
            if(!uiRoot) {
                uiRoot=new GameObject("KINGSHOT_ORIGINAL_UI");
                Undo.RegisterCreatedObjectUndo(uiRoot,"Create Kingshot Original UI");
            }

            // Registry stores every discovered original candidate without destroying anything.
            var reg=uiRoot.GetComponent<KingshotOriginalUIRegistryV17>();
            if(!reg) reg=Undo.AddComponent<KingshotOriginalUIRegistryV17>(uiRoot);
            reg.entries.Clear();

            foreach(var x in found)
                reg.entries.Add(new KingshotOriginalUIRegistryV17.Entry{
                    category=x.category,prefabName=x.prefab.name,assetPath=x.path
                });

            // Automatically place only the strongest likely building window.
            var best=found.FirstOrDefault(x =>
                x.category=="BUILDING" &&
                (x.prefab.name.ToLowerInvariant().Contains("panel") ||
                 x.prefab.name.ToLowerInvariant().Contains("window") ||
                 x.prefab.name.ToLowerInvariant().Contains("view") ||
                 x.prefab.name.ToLowerInvariant().Contains("popup")));

            if(best.prefab)
            {
                Transform old=uiRoot.transform.Find("OriginalBuildingWindow");
                if(old) Undo.DestroyObjectImmediate(old.gameObject);

                GameObject instance=(GameObject)PrefabUtility.InstantiatePrefab(best.prefab,uiRoot.transform);
                if(instance) {
                    instance.name="OriginalBuildingWindow";
                    instance.SetActive(false); // preserved original UI, ready for click binding
                    Undo.RegisterCreatedObjectUndo(instance,"Place Original Building UI");
                }
            }

            // Save exact scan report for the next automatic binding stage.
            string report="KINGSHOT ORIGINAL UI AUTO SCAN V17\n"+
                          "FOUND: "+found.Count+"\n\n";
            foreach(var x in found)
                report += $"[{x.score}] [{x.category}] {x.prefab.name}\n{x.path}\n\n";
            File.WriteAllText("Assets/KingshotOriginalUIReport.txt",report);

            EditorUtility.SetDirty(reg);
            EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
            AssetDatabase.Refresh();

            EditorUtility.ClearProgressBar();
            EditorUtility.DisplayDialog("Kingshot V17",
                "Avtomatik axtaris bitdi.\nTapilan UI prefab: "+found.Count+
                "\n\nOriginal UI siyahisi:\nAssets/KingshotOriginalUIReport.txt"+
                (best.prefab ? "\n\nEn guclu building UI scene-e hazir veziyyetde qoyuldu." :
                 "\n\nBuilding window avtomatik secilmedi; report yaradildi."),
                "OK");
        }
        catch(Exception e) {
            EditorUtility.ClearProgressBar();
            Debug.LogException(e);
            EditorUtility.DisplayDialog("Kingshot V17","Xeta: "+e.Message,"OK");
        }
    }

    static string Category(string s)
    {
        if(s.Contains("upgrade")) return "UPGRADE";
        if(s.Contains("construction")||s.Contains("construct")) return "CONSTRUCTION";
        if(s.Contains("building")||s.Contains("build")) return "BUILDING";
        if(s.Contains("city")) return "CITY";
        return "OTHER";
    }
}
