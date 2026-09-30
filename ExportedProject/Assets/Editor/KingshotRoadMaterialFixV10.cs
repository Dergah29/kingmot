using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotRoadMaterialFixV10
{
    [MenuItem("Kingshot/City/V10/Remove Road Black Second Material")]
    public static void Fix()
    {
        GameObject go = GameObject.Find("SceneRoot/MapRoot/Terrain/Terrain_ground_xiaolu");
        if (!go) {
            EditorUtility.DisplayDialog("Kingshot","Terrain_ground_xiaolu tapilmadi.","OK");
            return;
        }

        Renderer r = go.GetComponent<Renderer>();
        if (!r || r.sharedMaterials.Length < 2) {
            EditorUtility.DisplayDialog("Kingshot","2 material slot tapilmadi.","OK");
            return;
        }

        Undo.RecordObject(r,"Remove black road material");

        // Keep the confirmed normal road material in slot 0.
        // Remove slot 1: Terrain_ground_s_xiaoluzong.
        Material first = r.sharedMaterials[0];
        r.sharedMaterials = new Material[] { first };

        EditorUtility.SetDirty(r);
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());

        Debug.Log("[Kingshot V10] Terrain_ground_xiaolu: kept slot 0 ("+
                  (first ? first.name : "NULL")+
                  "), removed second material slot.");
    }
}
