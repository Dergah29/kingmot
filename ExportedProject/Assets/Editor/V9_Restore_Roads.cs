using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotRoadRestoreV9
{
    [MenuItem("Kingshot/City/V9/Restore Roads Keep Artifacts Hidden")]
    public static void Fix()
    {
        int restored=0, keptHidden=0;

        foreach(Renderer r in Object.FindObjectsOfType<Renderer>(true))
        {
            string path=FullPath(r.transform).ToLowerInvariant();
            if(path.Contains("auto_city_buildings")) continue;

            string n=r.gameObject.name.ToLowerInvariant();
            bool roadTerrain =
                n.Contains("road") || n.Contains("terrain_ground") ||
                path.Contains("/road") || path.Contains("/terrain");

            if(!roadTerrain) continue;

            bool definiteArtifact =
                n.Contains("shadow") ||
                MaterialsContain(r,"shadow");

            if(definiteArtifact) {
                if(r.enabled) {
                    Undo.RecordObject(r,"Hide road shadow artifact");
                    r.enabled=false;
                }
                keptHidden++;
                continue;
            }

            // V8 also disabled valid road/terrain renderers because of "_s_".
            // Restore everything that is not explicitly a shadow renderer.
            if(!r.enabled) {
                Undo.RecordObject(r,"Restore Kingshot road");
                r.enabled=true;
                EditorUtility.SetDirty(r);
                restored++;
            }
        }

        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        Debug.Log("[Kingshot V9] Restored="+restored+
                  ", explicit shadow helpers kept hidden="+keptHidden);

        EditorUtility.DisplayDialog("Kingshot V9",
            "Yollar geri acildi: "+restored+
            "\nShadow helper bagli saxlanildi: "+keptHidden+
            "\nBinalara toxunulmadi.","OK");
    }

    static bool MaterialsContain(Renderer r,string token) {
        token=token.ToLowerInvariant();
        foreach(Material m in r.sharedMaterials)
            if(m && m.name.ToLowerInvariant().Contains(token)) return true;
        return false;
    }

    static string FullPath(Transform t) {
        string s=t.name;
        while(t.parent!=null) { t=t.parent; s=t.name+"/"+s; }
        return s;
    }
}
