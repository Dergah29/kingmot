using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotAuxMeshRepairV7
{
    const string ROOT = "AUTO_CITY_BUILDINGS";

    [MenuItem("Kingshot/City/V7/Fix White Shadow And Line Meshes")]
    public static void Fix()
    {
        GameObject root = GameObject.Find(ROOT);
        if (!root) {
            EditorUtility.DisplayDialog("Kingshot", ROOT + " tapilmadi.", "OK");
            return;
        }

        Shader hidden = Shader.Find("KingshotRepair/ShadowHidden");
        if (!hidden) {
            EditorUtility.DisplayDialog("Kingshot",
                "KingshotRepair/ShadowHidden shader tapilmadi.", "OK");
            return;
        }

        int hiddenRenderers = 0;
        int keptMainRenderers = 0;

        foreach (Renderer r in root.GetComponentsInChildren<Renderer>(true))
        {
            string obj = r.gameObject.name.ToLowerInvariant();

            bool lowMesh =
                obj.Contains("_low") ||
                ParentContains(r.transform, "_low");

            bool shadowMesh =
                obj.Contains("shadow") ||
                MaterialsContain(r, "shadow");

            bool lineMesh =
                obj.Contains("_line") ||
                obj.Contains("line1") ||
                obj.Contains("line2") ||
                obj.Contains("line3") ||
                obj.Contains("line4") ||
                obj.Contains("line5") ||
                MaterialsContain(r, "line_color");

            // These are helper geometry in the extracted prefab.
            // V6 rendered textureless helpers as solid white.
            if (lowMesh || shadowMesh || lineMesh)
            {
                Undo.RecordObject(r, "Kingshot V7 helper mesh repair");

                Material[] mats = r.sharedMaterials;
                for (int i = 0; i < mats.Length; i++)
                {
                    if (!mats[i]) continue;

                    Material m = new Material(hidden);
                    m.name = "V7_Hidden_" + mats[i].name;
                    mats[i] = m;
                }

                r.sharedMaterials = mats;
                EditorUtility.SetDirty(r);
                hiddenRenderers++;
            }
            else
            {
                // Main textured building meshes are deliberately untouched.
                keptMainRenderers++;
            }
        }

        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());

        Debug.Log("[Kingshot V7] hidden helper renderers=" + hiddenRenderers +
                  ", untouched main renderers=" + keptMainRenderers +
                  ". Main building textures/materials were not changed.");

        EditorUtility.DisplayDialog("Kingshot V7",
            "Hazirdir.\nHelper shadow/low/line: " + hiddenRenderers +
            "\nToxunulmayan esas renderer: " + keptMainRenderers,
            "OK");
    }

    static bool ParentContains(Transform t, string token)
    {
        token = token.ToLowerInvariant();
        Transform p = t.parent;
        while (p != null)
        {
            if (p.name.ToLowerInvariant().Contains(token)) return true;
            p = p.parent;
        }
        return false;
    }

    static bool MaterialsContain(Renderer r, string token)
    {
        token = token.ToLowerInvariant();
        foreach (Material m in r.sharedMaterials)
        {
            if (m && m.name.ToLowerInvariant().Contains(token))
                return true;
        }
        return false;
    }
}
