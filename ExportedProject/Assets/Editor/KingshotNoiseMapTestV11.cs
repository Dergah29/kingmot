using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotNoiseMapTestV11
{
    [MenuItem("Kingshot/City/V11/Test Disable Road NoiseMap")]
    public static void DisableNoise()
    {
        Material m=AssetDatabase.LoadAssetAtPath<Material>("Assets/Terrain_ground_xiaoluzong.mat");
        if(!m) {
            EditorUtility.DisplayDialog("Kingshot","Terrain_ground_xiaoluzong.mat tapilmadi.","OK");
            return;
        }
        if(!m.HasProperty("_NoiseMap")) {
            EditorUtility.DisplayDialog("Kingshot","Materialda _NoiseMap yoxdur.","OK");
            return;
        }

        Undo.RecordObject(m,"Disable road NoiseMap");
        m.SetTexture("_NoiseMap",null);
        EditorUtility.SetDirty(m);
        AssetDatabase.SaveAssets();
        SceneView.RepaintAll();

        Debug.Log("[Kingshot V11] Terrain_ground_xiaoluzong _NoiseMap = NULL");
        EditorUtility.DisplayDialog("Kingshot V11",
            "NoiseMap sonduruldu.\nIndi Scene-de qara lekelerin deyisib-deyismediyine bax.","OK");
    }

    [MenuItem("Kingshot/City/V11/Restore Road NoiseMap")]
    public static void RestoreNoise()
    {
        Material m=AssetDatabase.LoadAssetAtPath<Material>("Assets/Terrain_ground_xiaoluzong.mat");
        Texture t=AssetDatabase.LoadAssetAtPath<Texture>("Assets/3d_common_ground_mask.png");
        if(!m || !t) {
            EditorUtility.DisplayDialog("Kingshot","Material ve ya mask texture tapilmadi.","OK");
            return;
        }

        Undo.RecordObject(m,"Restore road NoiseMap");
        m.SetTexture("_NoiseMap",t);
        m.SetTextureScale("_NoiseMap",new Vector2(0.05f,0.05f));
        m.SetTextureOffset("_NoiseMap",Vector2.zero);
        EditorUtility.SetDirty(m);
        AssetDatabase.SaveAssets();
        SceneView.RepaintAll();

        Debug.Log("[Kingshot V11] Road NoiseMap restored.");
    }
}
