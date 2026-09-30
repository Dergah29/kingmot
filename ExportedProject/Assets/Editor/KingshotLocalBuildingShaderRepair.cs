using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System.Collections.Generic;

public static class KingshotLocalBuildingShaderRepair
{
    const string ROOT = "AUTO_CITY_BUILDINGS";

    [MenuItem("Kingshot/City/V2/Repair AUTO Building Shaders")]
    public static void Repair()
    {
        GameObject root = GameObject.Find(ROOT);
        if (root == null)
        {
            EditorUtility.DisplayDialog("Kingshot", ROOT + " tapilmadi.", "OK");
            return;
        }

        Shader cartoon = Shader.Find("KingshotRepair/Cartoon");
        Shader transparent = Shader.Find("KingshotRepair/Transparent");
        Shader shadow = Shader.Find("KingshotRepair/ShadowHidden");

        if (cartoon == null)
        {
            EditorUtility.DisplayDialog("Kingshot",
                "KingshotRepair/Cartoon shader tapilmadi. KingshotRepair qovlugunu yoxla.",
                "OK");
            return;
        }

        var renderers = root.GetComponentsInChildren<Renderer>(true);
        var repaired = new HashSet<Material>();
        int changed = 0;

        Undo.IncrementCurrentGroup();
        int undoGroup = Undo.GetCurrentGroup();
        Undo.SetCurrentGroupName("Repair AUTO City Building Shaders");

        foreach (Renderer r in renderers)
        {
            Material[] mats = r.sharedMaterials;
            foreach (Material m in mats)
            {
                if (m == null || repaired.Contains(m)) continue;
                repaired.Add(m);

                Shader oldShader = m.shader;
                string oldName = oldShader != null ? oldShader.name : "";
                string n = (m.name + " " + oldName).ToLowerInvariant();

                // Only repair materials actually used by AUTO_CITY_BUILDINGS.
                // Leave already-repaired materials alone.
                if (oldName.StartsWith("KingshotRepair/"))
                    continue;

                Shader target = cartoon;

                if ((n.Contains("shadow") || n.Contains("groundshadow")) && shadow != null)
                    target = shadow;
                else if ((n.Contains("transparent") || n.Contains("alpha") ||
                          n.Contains("glass") || n.Contains("fx")) && transparent != null)
                    target = transparent;

                Texture main = FirstTexture(m,
                    "_BaseMap", "_MainTex", "_Albedo", "_DiffuseMap", "_BaseColorMap");

                Color color = Color.white;
                if (m.HasProperty("_BaseColor")) color = m.GetColor("_BaseColor");
                else if (m.HasProperty("_Color")) color = m.GetColor("_Color");

                Undo.RecordObject(m, "Repair Kingshot building material");
                m.shader = target;

                if (main != null)
                {
                    if (m.HasProperty("_BaseMap")) m.SetTexture("_BaseMap", main);
                    if (m.HasProperty("_MainTex")) m.SetTexture("_MainTex", main);
                }

                if (m.HasProperty("_BaseColor")) m.SetColor("_BaseColor", color);
                if (m.HasProperty("_Color")) m.SetColor("_Color", color);

                EditorUtility.SetDirty(m);
                changed++;
            }
        }

        Undo.CollapseUndoOperations(undoGroup);
        AssetDatabase.SaveAssets();
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());

        Debug.Log("[Kingshot] AUTO building shader repair finished. Renderers=" +
                  renderers.Length + ", unique materials=" + repaired.Count +
                  ", changed=" + changed +
                  ". Ctrl+Z ile geri qaytarmaq olar.");
    }

    static Texture FirstTexture(Material m, params string[] props)
    {
        foreach (string p in props)
            if (m.HasProperty(p))
            {
                Texture t = m.GetTexture(p);
                if (t != null) return t;
            }
        return null;
    }
}
