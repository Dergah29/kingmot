using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.SceneManagement;

public static class KingshotAutoRebuilder
{
    private const string RootName = "Kingshot_AutoBuildings";

    private struct Building
    {
        public int bid;
        public string model;
        public Vector3 position;
        public float rotationY;

        public Building(int bid, string model, float x, float y, float z, float ry)
        {
            this.bid = bid;
            this.model = model;
            this.position = new Vector3(x, y, z);
            this.rotationY = ry;
        }
    }

    // game_config_default_buildinfo.bytes -> coordinates
    private static readonly Building[] Buildings =
    {
        new Building(301, "city_building_furnace_00", 0, 0, 0, 0),

        new Building(302, "city_building_sawmill_00", 27, 0, 27, 42),
        new Building(303, "city_building_coalmine_00", 37, 0, 8, -10),
        new Building(304, "city_building_ironworks_00", 36, 0, -9.5f, 15),
        new Building(305, "city_building_hunter_cabin_00", 10, 0, 36, 17),
        new Building(306, "city_building_kitchen_00", 0, 0, 21.5f, 0),
        new Building(307, "city_building_hospital_00", -14, 0, 36, -22),

        new Building(308, "city_building_dorm_00", 18.5f, 0, 1, 86),
        new Building(309, "city_building_dorm_00", 14.5f, 0, 12.5f, 51),
        new Building(310, "city_building_dorm_00", -18.5f, 0, 0, -91),
        new Building(311, "city_building_dorm_00", -15, 0, 13, -51.5f),
        new Building(312, "city_building_dorm_00", -33.5f, 0, -8.5f, -101),
        new Building(313, "city_building_dorm_00", -34.5f, 0, 3.5f, -88),
        new Building(314, "city_building_dorm_00", -31.5f, 0, 15.5f, -60),
        new Building(315, "city_building_dorm_00", -25.5f, 0, 25, -45),

        new Building(318, "city_building_heroes_hall_00", 14.5f, 0, -36.5f, 0),
        new Building(319, "city_building_law_office_00", -29.5f, 0, -41.5f, 0),

        new Building(321, "city_building_infantry_quarters_00", 16.5f, 0, -56, 0),
        new Building(322, "city_building_pikeman_camp_00", 35, 0, -57, 0),
        new Building(323, "city_anim_building_archer_house_00", 14, 0, -80, 0),
        new Building(324, "city_building_military_hospital_00", -15.5f, 0, -56, 0),
        new Building(325, "city_anim_building_embassy_00", 31.5f, 0, -96.5f, 0),

        new Building(326, "city_building_arena_00", 33.5f, 0, -78.5f, 0),
        new Building(327, "city_building_warehouse_00", -30, 0, -78.5f, 0),
        new Building(328, "city_building_lighthouse_00", 32, 0, -40, 0),
        new Building(329, "city_anim_building_lab_00", -13, 0, -83, 0),
        new Building(330, "city_anim_building_conscription_office_00", -34.5f, 0, -58.5f, 0),
        new Building(331, "city_building_command_00", -12.5f, 0, -101.5f, 0),
        new Building(332, "city_building_arena_00", 11.5f, 0, -100, 0),

        new Building(335, "city_building_monument_00", 0, 0, -68, 0),
        new Building(336, "city_building_firecrystal_alchemist_workshop_00", 12.5f, 0, -118, 0),
        new Building(337, "city_anim_building_firecrystal_wra_cademy_00", -17, 0, -119.5f, 0),
        new Building(339, "city_building_pet_home_00", -32, 0, -96, 0),

        new Building(401, "city_building_td_gate_01_00", 0, 0, -27, 0),
        new Building(402, "city_building_td_gate_02b_00", 0, 0, -115, 0),

        new Building(341, "city_anim_building_expert_academy_00", -52, 0, -105.5f, 0),
    };

    [MenuItem("Tools/Kingshot/Rebuild City Buildings")]
    public static void Rebuild()
    {
        if (EditorApplication.isPlaying)
        {
            Debug.LogError("KINGSHOT: Play Mode-dan çıx.");
            return;
        }

        Scene scene = SceneManager.GetActiveScene();

        if (!scene.IsValid())
        {
            Debug.LogError("KINGSHOT: Active scene tapılmadı.");
            return;
        }

        DeleteExistingRoot();

        GameObject root = new GameObject(RootName);
        Undo.RegisterCreatedObjectUndo(root, "Create Kingshot Auto Buildings");

        int created = 0;
        int missing = 0;

        List<string> report = new List<string>();
        report.Add("KINGSHOT AUTO CITY REBUILD");
        report.Add("Scene: " + scene.name);
        report.Add("");

        Dictionary<string, GameObject> prefabCache =
            new Dictionary<string, GameObject>(StringComparer.OrdinalIgnoreCase);

        foreach (Building b in Buildings)
        {
            GameObject prefab;

            if (!prefabCache.TryGetValue(b.model, out prefab))
            {
                prefab = FindBestPrefab(b.model);
                prefabCache[b.model] = prefab;
            }

            if (prefab == null)
            {
                missing++;
                string msg = $"MISSING | BID {b.bid} | {b.model}";
                report.Add(msg);
                Debug.LogWarning("KINGSHOT " + msg);
                continue;
            }

            GameObject instance =
                PrefabUtility.InstantiatePrefab(prefab, scene) as GameObject;

            if (instance == null)
            {
                missing++;
                report.Add($"FAILED | BID {b.bid} | {b.model}");
                continue;
            }

            Undo.RegisterCreatedObjectUndo(instance, "Kingshot Building");

            instance.name = $"BID_{b.bid}_{b.model}";
            instance.transform.SetParent(root.transform, false);

            instance.transform.localPosition = b.position;
            instance.transform.localRotation =
                Quaternion.Euler(0f, b.rotationY, 0f);

            instance.transform.localScale = Vector3.one;

            created++;

            report.Add(
                $"OK | BID {b.bid} | {b.model} | " +
                $"POS {b.position.x},{b.position.y},{b.position.z} | " +
                $"ROT-Y {b.rotationY}"
            );
        }

        Selection.activeGameObject = root;

        EditorSceneManager.MarkSceneDirty(scene);

        string reportPath =
            @"D:\asset\test4454\KINGSHOT_AUTO_CITY_REPORT.txt";

        report.Add("");
        report.Add("CREATED: " + created);
        report.Add("MISSING: " + missing);

        try
        {
            File.WriteAllLines(reportPath, report);
        }
        catch (Exception e)
        {
            Debug.LogWarning("Report yazılmadı: " + e.Message);
        }

        Debug.Log(
            $"KINGSHOT AUTO CITY COMPLETE | Created: {created} | Missing: {missing}"
        );
    }

    [MenuItem("Tools/Kingshot/Delete Auto Buildings")]
    public static void DeleteAutoBuildings()
    {
        DeleteExistingRoot();

        Scene scene = SceneManager.GetActiveScene();
        if (scene.IsValid())
            EditorSceneManager.MarkSceneDirty(scene);

        Debug.Log("KINGSHOT: Auto-created buildings silindi.");
    }

    private static void DeleteExistingRoot()
    {
        GameObject root = GameObject.Find(RootName);

        if (root != null)
            Undo.DestroyObjectImmediate(root);
    }

    private static GameObject FindBestPrefab(string exactName)
    {
        string[] guids = AssetDatabase.FindAssets(
            "\"" + exactName + "\" t:GameObject"
        );

        List<string> paths = new List<string>();

        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);

            if (string.IsNullOrEmpty(path))
                continue;

            string fileName = Path.GetFileNameWithoutExtension(path);

            if (string.Equals(
                    fileName,
                    exactName,
                    StringComparison.OrdinalIgnoreCase))
            {
                paths.Add(path);
            }
        }

        // AssetRipper eyni adlı obyektlər çıxara bilər.
        // Prefab asset olan ən uyğun path seçilir.
        foreach (string path in paths.OrderBy(p => p.Length))
        {
            GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>(path);

            if (obj == null)
                continue;

            PrefabAssetType type = PrefabUtility.GetPrefabAssetType(obj);

            if (type != PrefabAssetType.NotAPrefab)
                return obj;
        }

        // Exact filename tapılmasa, Unity search nəticələrinə bax.
        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>(path);

            if (obj != null &&
                string.Equals(
                    obj.name,
                    exactName,
                    StringComparison.OrdinalIgnoreCase))
            {
                return obj;
            }
        }

        return null;
    }
}