using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotRoadArtifactRepairV8
{
    [MenuItem("Kingshot/City/V8/Hide Road Black Helper Meshes")]
    public static void Fix()
    {
        int changed=0;

        foreach(Renderer r in Object.FindObjectsOfType<Renderer>(true))
        {
            string n=r.gameObject.name.ToLowerInvariant();
            string path=FullPath(r.transform).ToLowerInvariant();

            // Conservative: only road/terrain objects, never AUTO building meshes.
            if(path.Contains("auto_city_buildings")) continue;
            bool road = n.Contains("road") || n.Contains("terrain_ground") ||
                        path.Contains("/road") || path.Contains("/terrain");

            if(!road) continue;

            bool helper = n.Contains("shadow") || n.Contains("_s_") ||
                          n.EndsWith("_s") || MaterialsContain(r,"shadow") ||
                          MaterialsContain(r,"terrain_ground_s");

            if(!helper) continue;

            Undo.RecordObject(r,"Hide Kingshot road artifact");
            r.enabled=false;
            EditorUtility.SetDirty(r);
            changed++;
        }

        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        Debug.Log("[Kingshot V8] Disabled road/terrain helper renderers: "+changed);
        EditorUtility.DisplayDialog("Kingshot V8",
            "Road/terrain helper renderer gizledildi: "+changed+
            "\nAUTO_CITY_BUILDINGS-e toxunulmadi.","OK");
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
