using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

public static class KingshotFurnaceMaterialBinder
{
    private const string VisualName = "KINGSHOT_FURNACE_LEVEL_VISUAL";

    [MenuItem("Kingshot/City/Furnace/Bind Missing Furnace Materials")]
    public static void Bind()
    {
        GameObject root = GameObject.Find(VisualName);

        if (root == null)
        {
            EditorUtility.DisplayDialog(
                "Kingshot",
                VisualName + " tapilmadi.",
                "OK"
            );
            return;
        }

        string[] materialGuids = AssetDatabase.FindAssets("t:Material");

        List<MaterialInfo> materials = new List<MaterialInfo>();

        foreach (string guid in materialGuids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            Material mat = AssetDatabase.LoadAssetAtPath<Material>(path);

            if (mat == null)
                continue;

            string combined =
                (mat.name + " " + path).ToLowerInvariant();

            if (!combined.Contains("furnace"))
                continue;

            materials.Add(new MaterialInfo
            {
                material = mat,
                path = path,
                normalized = Normalize(mat.name)
            });
        }

        Renderer[] renderers =
            root.GetComponentsInChildren<Renderer>(true);

        int assigned = 0;
        int unresolved = 0;

        StringBuilder report = new StringBuilder();

        report.AppendLine("KINGSHOT FURNACE MATERIAL BINDER");
        report.AppendLine("Furnace materials found: " + materials.Count);
        report.AppendLine();

        foreach (Renderer renderer in renderers)
        {
            Material[] slots = renderer.sharedMaterials;

            if (slots == null || slots.Length == 0)
                slots = new Material[1];

            bool changed = false;

            for (int i = 0; i < slots.Length; i++)
            {
                if (slots[i] != null)
                    continue;

                Material match =
                    FindBestMaterial(renderer, materials);

                if (match != null)
                {
                    slots[i] = match;
                    changed = true;
                    assigned++;

                    report.AppendLine(
                        "OK | " +
                        renderer.name +
                        " -> " +
                        match.name +
                        " | " +
                        AssetDatabase.GetAssetPath(match)
                    );
                }
                else
                {
                    unresolved++;

                    report.AppendLine(
                        "MISSING | " + renderer.name
                    );
                }
            }

            if (changed)
            {
                Undo.RecordObject(
                    renderer,
                    "Bind Furnace Material"
                );

                renderer.sharedMaterials = slots;

                EditorUtility.SetDirty(renderer);
            }
        }

        string reportPath =
            @"D:\asset\test4454\KINGSHOT_FURNACE_MATERIAL_BIND.txt";

        File.WriteAllText(
            reportPath,
            report.ToString()
        );

        EditorSceneManager.MarkSceneDirty(
            root.scene
        );

        AssetDatabase.SaveAssets();

        Selection.activeGameObject = root;

        Debug.Log(
            "KINGSHOT Furnace Material Bind complete. " +
            "Assigned: " + assigned +
            " | Missing: " + unresolved +
            " | Report: " + reportPath
        );

        EditorUtility.DisplayDialog(
            "Kingshot Furnace",
            "Assigned: " + assigned +
            "\nMissing: " + unresolved,
            "OK"
        );
    }

    private static Material FindBestMaterial(
        Renderer renderer,
        List<MaterialInfo> materials)
    {
        string rendererName =
            Normalize(renderer.name);

        string meshName = "";

        MeshFilter mf =
            renderer.GetComponent<MeshFilter>();

        if (mf != null &&
            mf.sharedMesh != null)
        {
            meshName =
                Normalize(mf.sharedMesh.name);
        }

        MaterialInfo best = null;
        int bestScore = 0;

        foreach (MaterialInfo info in materials)
        {
            int score = 0;

            string mat =
                info.normalized;

            score += Score(rendererName, mat);

            if (!string.IsNullOrEmpty(meshName))
                score += Score(meshName, mat);

            // Furnace 12 materiallarini ustun tut.
            if (mat.Contains("furnace12"))
                score += 25;

            bool rendererShadow =
                rendererName.Contains("shadow");

            bool rendererRoof =
                rendererName.Contains("roof");

            bool rendererGlass =
                rendererName.Contains("glass");

            bool rendererLine =
                rendererName.Contains("line");

            if (rendererShadow &&
                mat.Contains("shadow"))
                score += 60;

            if (rendererRoof &&
                mat.Contains("roof"))
                score += 60;

            if (rendererGlass &&
                (mat.Contains("glass") ||
                 mat.Contains("alpha") ||
                 mat.Contains("transparent")))
                score += 60;

            if (rendererLine &&
                mat.Contains("line"))
                score += 60;

            if (rendererLine &&
                mat.Contains("shadow"))
                score -= 40;

            if (rendererShadow &&
                mat.Contains("line"))
                score -= 40;

            if (score > bestScore)
            {
                bestScore = score;
                best = info;
            }
        }

        // Cox zeif texminleri baglamiriq.
        if (best == null || bestScore < 55)
            return null;

        return best.material;
    }

    private static int Score(
        string objectName,
        string materialName)
    {
        if (string.IsNullOrEmpty(objectName) ||
            string.IsNullOrEmpty(materialName))
            return 0;

        int score = 0;

        if (objectName == materialName)
            score += 200;

        if (materialName.Contains(objectName))
            score += 120;

        if (objectName.Contains(materialName))
            score += 100;

        string[] tokens =
            objectName.Split(
                new char[] { '_' },
                StringSplitOptions.RemoveEmptyEntries
            );

        foreach (string token in tokens)
        {
            if (token.Length < 3)
                continue;

            if (materialName.Contains(token))
                score += 8;
        }

        return score;
    }

    private static string Normalize(string s)
    {
        if (string.IsNullOrEmpty(s))
            return "";

        return s
            .ToLowerInvariant()
            .Replace(" ", "")
            .Replace("_", "")
            .Replace("-", "");
    }

    private class MaterialInfo
    {
        public Material material;
        public string path;
        public string normalized;
    }
}