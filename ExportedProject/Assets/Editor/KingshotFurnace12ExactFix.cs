using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotFurnace12ExactFix
{
    private const string RootName = "KINGSHOT_FURNACE_LEVEL_VISUAL";

    [MenuItem("Kingshot/City/Furnace/FIX Furnace 12 Exact Material")]
    public static void Fix()
    {
        GameObject root = GameObject.Find(RootName);

        if (root == null)
        {
            EditorUtility.DisplayDialog(
                "Kingshot",
                "KINGSHOT_FURNACE_LEVEL_VISUAL tapilmadi.",
                "OK"
            );
            return;
        }

        Material sourceMat =
            AssetDatabase.LoadAssetAtPath<Material>(
                "Assets/3d_city_building_furnace_12.mat"
            );

        Texture2D texture =
            AssetDatabase.LoadAssetAtPath<Texture2D>(
                "Assets/3d_city_building_furnace_12.png"
            );

        if (sourceMat == null)
        {
            EditorUtility.DisplayDialog(
                "Kingshot",
                "3d_city_building_furnace_12.mat tapilmadi.",
                "OK"
            );
            return;
        }

        Shader cartoon =
            Shader.Find("KingshotRepair/Cartoon");

        Shader transparent =
            Shader.Find("KingshotRepair/Transparent");

        Shader shadow =
            Shader.Find("KingshotRepair/ShadowHidden");

        Renderer[] renderers =
            root.GetComponentsInChildren<Renderer>(true);

        int fixedCount = 0;

        foreach (Renderer r in renderers)
        {
            Undo.RecordObject(r, "Fix Furnace 12 Material");

            Material mat =
                new Material(sourceMat);

            mat.name =
                "KS_Furnace12_" + r.name;

            string n =
                r.name.ToLowerInvariant();

            if (n.Contains("shadow"))
            {
                if (shadow != null)
                    mat.shader = shadow;
            }
            else if (n.Contains("glass"))
            {
                if (transparent != null)
                    mat.shader = transparent;

                if (texture != null)
                {
                    SetTexture(mat, texture);
                }
            }
            else
            {
                if (cartoon != null)
                    mat.shader = cartoon;

                if (texture != null)
                {
                    SetTexture(mat, texture);
                }
            }

            r.sharedMaterial = mat;

            EditorUtility.SetDirty(r);

            fixedCount++;
        }

        EditorSceneManager.MarkSceneDirty(root.scene);

        Selection.activeGameObject = root;

        Debug.Log(
            "KINGSHOT Furnace 12 exact fix complete. Renderers: "
            + fixedCount
        );

        EditorUtility.DisplayDialog(
            "Kingshot",
            "Furnace 12 duzeldildi.\nRenderers: " + fixedCount,
            "OK"
        );
    }

    private static void SetTexture(
        Material mat,
        Texture2D tex)
    {
        if (mat.HasProperty("_BaseMap"))
            mat.SetTexture("_BaseMap", tex);

        if (mat.HasProperty("_MainTex"))
            mat.SetTexture("_MainTex", tex);

        if (mat.HasProperty("_BaseTex"))
            mat.SetTexture("_BaseTex", tex);
    }
}