using UnityEngine;
using UnityEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

public static class KingshotCityVariantScanner
{
    private static readonly string[] Keywords =
    {
        "city_building_",
        "city_anim_building_",
        "firecrystal",
        "furnace",
        "hospital",
        "kitchen",
        "hunter",
        "ironworks",
        "coalmine",
        "sawmill",
        "dorm",
        "warehouse",
        "embassy",
        "archer",
        "pikeman",
        "infantry",
        "lighthouse",
        "lab",
        "conscription",
        "command",
        "arena",
        "heroes_hall",
        "law_office",
        "monument"
    };

    [MenuItem("Kingshot/City/Scan Building Variants")]
    public static void Scan()
    {
        var guids = AssetDatabase.FindAssets("t:Prefab");
        var rows = new List<string>();

        foreach (var guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            var prefab = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            if (prefab == null) continue;

            string n = prefab.name.ToLowerInvariant();
            if (!Keywords.Any(k => n.Contains(k)))
                continue;

            rows.Add(prefab.name + "\t" + path);
        }

        rows = rows
            .Distinct()
            .OrderBy(x => x, StringComparer.OrdinalIgnoreCase)
            .ToList();

        string report =
            "KINGSHOT BUILDING VARIANT SCAN\n" +
            "Generated from prefabs currently present in this AssetRipper project.\n\n" +
            "Prefab count: " + rows.Count + "\n\n" +
            string.Join("\n", rows);

        string outPath = "Assets/KingshotBuildingVariants.txt";
        File.WriteAllText(outPath, report);
        AssetDatabase.Refresh();

        var asset = AssetDatabase.LoadAssetAtPath<TextAsset>(outPath);
        Selection.activeObject = asset;

        Debug.Log("[Kingshot] Variant scan finished. " + rows.Count +
                  " prefab candidates. Report: " + outPath);
    }
}
