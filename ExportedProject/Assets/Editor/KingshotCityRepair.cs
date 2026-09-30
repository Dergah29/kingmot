using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

public static class KingshotCityRepair
{
    [MenuItem("Tools/Kingshot/Repair ALL Remaining City Materials")]
    public static void RepairAllRemaining()
    {
        Shader world = Shader.Find("KingshotRepair/World");
        Shader transparent = Shader.Find("KingshotRepair/Transparent");

        if (world == null || transparent == null)
        {
            Debug.LogError("World veya Transparent replacement shader tapilmadi.");
            return;
        }

        string[] worldShaders =
        {
            "DianDian/TD/Cartoon_Ground_Grass",
            "DianDian/TD/Cartoon_Ground_Outside",
            "DianDian/TD/Cartoon_Ground_Outside_S",
            "DianDian/TD/Cartoon_Road",
            "DianDian/TD/Cartoon_Road_S",
            "DianDian/TD/Cartoon_ShadowMask"
        };

        string[] transparentShaders =
        {
            "DianDian/TD/Cartoon_Water",
            "DianDian/TD/Cartoon_Glass",
            "DianDian/FX/CommonFX"
        };

        HashSet<string> worldSet = new HashSet<string>(worldShaders);
        HashSet<string> transparentSet = new HashSet<string>(transparentShaders);

        string[] guids = AssetDatabase.FindAssets("t:Material");

        int worldCount = 0;
        int transparentCount = 0;

        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            Material mat = AssetDatabase.LoadAssetAtPath<Material>(path);

            if (mat == null || mat.shader == null)
                continue;

            string originalShader = mat.shader.name;

            bool makeWorld = worldSet.Contains(originalShader);
            bool makeTransparent = transparentSet.Contains(originalShader);

            if (!makeWorld && !makeTransparent)
                continue;

            Texture baseMap = null;
            Texture mainTex = null;

            Vector2 baseScale = Vector2.one;
            Vector2 baseOffset = Vector2.zero;
            Vector2 mainScale = Vector2.one;
            Vector2 mainOffset = Vector2.zero;

            Color baseColor = Color.white;
            Color mainColor = Color.white;

            if (mat.HasProperty("_BaseMap"))
            {
                baseMap = mat.GetTexture("_BaseMap");
                baseScale = mat.GetTextureScale("_BaseMap");
                baseOffset = mat.GetTextureOffset("_BaseMap");
            }

            if (mat.HasProperty("_MainTex"))
            {
                mainTex = mat.GetTexture("_MainTex");
                mainScale = mat.GetTextureScale("_MainTex");
                mainOffset = mat.GetTextureOffset("_MainTex");
            }

            if (mat.HasProperty("_BaseColor"))
                baseColor = mat.GetColor("_BaseColor");

            if (mat.HasProperty("_MainColor"))
                mainColor = mat.GetColor("_MainColor");

            Undo.RecordObject(mat, "Kingshot City Material Repair");

            mat.shader = makeTransparent ? transparent : world;

            if (baseMap != null)
            {
                mat.SetTexture("_BaseMap", baseMap);
                mat.SetTextureScale("_BaseMap", baseScale);
                mat.SetTextureOffset("_BaseMap", baseOffset);
            }

            if (mainTex != null)
            {
                mat.SetTexture("_MainTex", mainTex);
                mat.SetTextureScale("_MainTex", mainScale);
                mat.SetTextureOffset("_MainTex", mainOffset);
                mat.SetFloat("_KSUseMainTex", baseMap == null ? 1f : 0f);
            }
            else
            {
                mat.SetFloat("_KSUseMainTex", 0f);
            }

            mat.SetColor("_BaseColor", baseColor);
            mat.SetColor("_MainColor", mainColor);

            EditorUtility.SetDirty(mat);

            if (makeTransparent)
                transparentCount++;
            else
                worldCount++;
        }

        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();

        Debug.Log(
            "KINGSHOT REMAINING CITY REPAIR COMPLETE\n" +
            "World materials: " + worldCount + "\n" +
            "Transparent/FX materials: " + transparentCount
        );
    }
}