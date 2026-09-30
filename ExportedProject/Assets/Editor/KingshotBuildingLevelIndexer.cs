using UnityEngine;
using UnityEditor;
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Collections.Generic;

public static class KingshotBuildingLevelIndexer
{
    private const string ReportPath =
        @"D:\asset\test4454\KINGSHOT_BUILDING_LEVEL_INDEX.txt";

    [MenuItem("Tools/Kingshot/Scan Building Level Assets")]
    public static void Scan()
    {
        string[] guids = AssetDatabase.FindAssets("t:GameObject");

        var results = new List<Entry>();

        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);

            if (string.IsNullOrEmpty(path))
                continue;

            string name = Path.GetFileNameWithoutExtension(path);

            if (string.IsNullOrEmpty(name))
                continue;

            string lower = name.ToLowerInvariant();

            // Yalnız şəhər bina assetləri.
            if (!lower.Contains("city_building_") &&
                !lower.Contains("city_anim_building_"))
                continue;

            GameObject obj =
                AssetDatabase.LoadAssetAtPath<GameObject>(path);

            if (obj == null)
                continue;

            var renderers =
                obj.GetComponentsInChildren<Renderer>(true);

            var meshes =
                obj.GetComponentsInChildren<MeshFilter>(true);

            results.Add(new Entry
            {
                name = name,
                path = path,
                rendererCount = renderers.Length,
                meshCount = meshes.Length,
                childCount = CountChildren(obj.transform)
            });
        }

        results = results
            .OrderBy(x => GetFamily(x.name))
            .ThenBy(x => x.name)
            .ThenBy(x => x.path)
            .ToList();

        var sb = new StringBuilder();

        sb.AppendLine("KINGSHOT BUILDING LEVEL / MODEL INDEX");
        sb.AppendLine("Generated: " + DateTime.Now);
        sb.AppendLine("Total candidates: " + results.Count);
        sb.AppendLine();

        string lastFamily = null;

        foreach (Entry e in results)
        {
            string family = GetFamily(e.name);

            if (family != lastFamily)
            {
                sb.AppendLine();
                sb.AppendLine(
                    "=================================================="
                );
                sb.AppendLine("FAMILY: " + family);
                sb.AppendLine(
                    "=================================================="
                );

                lastFamily = family;
            }

            sb.AppendLine("NAME: " + e.name);
            sb.AppendLine("PATH: " + e.path);
            sb.AppendLine(
                "RENDERERS: " + e.rendererCount +
                " | MESHES: " + e.meshCount +
                " | CHILDREN: " + e.childCount
            );

            sb.AppendLine();
        }

        File.WriteAllText(ReportPath, sb.ToString());

        Debug.Log(
            "KINGSHOT: Building asset scan complete. " +
            results.Count +
            " candidates. Report: " +
            ReportPath
        );

        EditorUtility.RevealInFinder(ReportPath);
    }

    [MenuItem("Tools/Kingshot/Scan Furnace Assets Only")]
    public static void ScanFurnace()
    {
        string[] guids =
            AssetDatabase.FindAssets("furnace t:GameObject");

        var sb = new StringBuilder();

        sb.AppendLine("KINGSHOT FURNACE ASSET INDEX");
        sb.AppendLine();

        int count = 0;

        foreach (string guid in guids)
        {
            string path =
                AssetDatabase.GUIDToAssetPath(guid);

            GameObject obj =
                AssetDatabase.LoadAssetAtPath<GameObject>(path);

            if (obj == null)
                continue;

            string lower =
                (obj.name + " " + path).ToLowerInvariant();

            if (!lower.Contains("furnace"))
                continue;

            count++;

            sb.AppendLine("----------------------------------");
            sb.AppendLine("NAME: " + obj.name);
            sb.AppendLine("PATH: " + path);

            Renderer[] renderers =
                obj.GetComponentsInChildren<Renderer>(true);

            sb.AppendLine(
                "RENDERERS: " + renderers.Length
            );

            foreach (Renderer r in renderers)
            {
                sb.AppendLine(
                    "  RENDERER: " + GetHierarchyPath(r.transform)
                );

                foreach (Material m in r.sharedMaterials)
                {
                    if (m == null)
                        continue;

                    sb.AppendLine(
                        "      MATERIAL: " + m.name
                    );

                    if (m.shader != null)
                    {
                        sb.AppendLine(
                            "      SHADER: " + m.shader.name
                        );
                    }
                }
            }

            sb.AppendLine();
        }

        string furnaceReport =
            @"D:\asset\test4454\KINGSHOT_FURNACE_INDEX.txt";

        File.WriteAllText(
            furnaceReport,
            sb.ToString()
        );

        Debug.Log(
            "KINGSHOT: Furnace scan complete. Found: " +
            count
        );

        EditorUtility.RevealInFinder(furnaceReport);
    }

    private static int CountChildren(Transform root)
    {
        int count = 0;

        foreach (Transform child in root)
        {
            count++;
            count += CountChildren(child);
        }

        return count;
    }

    private static string GetHierarchyPath(
        Transform transform)
    {
        string path = transform.name;

        Transform current = transform.parent;

        while (current != null)
        {
            path =
                current.name + "/" + path;

            current = current.parent;
        }

        return path;
    }

    private static string GetFamily(string name)
    {
        if (string.IsNullOrEmpty(name))
            return "UNKNOWN";

        string n = name.ToLowerInvariant();

        n = RemoveEndingNumber(n);

        if (n.EndsWith("_a") ||
            n.EndsWith("_b") ||
            n.EndsWith("_c"))
        {
            n = n.Substring(
                0,
                n.Length - 2
            );
        }

        return n;
    }

    private static string RemoveEndingNumber(
        string value)
    {
        int underscore =
            value.LastIndexOf('_');

        if (underscore < 0)
            return value;

        string ending =
            value.Substring(underscore + 1);

        int number;

        if (int.TryParse(ending, out number))
        {
            return value.Substring(
                0,
                underscore
            );
        }

        return value;
    }

    private class Entry
    {
        public string name;
        public string path;
        public int rendererCount;
        public int meshCount;
        public int childCount;
    }
}