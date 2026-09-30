using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System.Collections.Generic;
using System.IO;

public static class KingshotCityRebuilder
{
    private const string ROOT_NAME = "AUTO_CITY_BUILDINGS";

    private class B
    {
        public int bid;
        public string model;
        public Vector3 pos;
        public float angleY;

        public B(int bid, string model, float x, float y, float z, float angleY)
        {
            this.bid = bid;
            this.model = model;
            this.pos = new Vector3(x, y, z);
            this.angleY = angleY;
        }
    }

    private static readonly B[] Buildings =
    {
        new B(341, "city_anim_building_expert_academy_00", -52f, 0f, -105.5f, 0f),
        new B(402, "city_building_td_gate_02b_00", 0f, 0f, -115f, 0f),
        new B(401, "city_building_td_gate_01_00", 0f, 0f, -27f, 0f),
        new B(339, "city_building_pet_home_00", -32f, 0f, -96f, 0f),
        new B(337, "city_anim_building_firecrystal_wra_cademy_00", -17f, 0f, -119.5f, 0f),
        new B(336, "city_building_firecrystal_alchemist_workshop_00", 12.5f, 0f, -118f, 0f),
        new B(335, "city_building_monument_00", 0f, 0f, -68f, 0f),
        new B(332, "city_building_arena_00", 11.5f, 0f, -100f, 0f),
        new B(331, "city_building_command_00", -12.5f, 0f, -101.5f, 0f),
        new B(330, "city_anim_building_conscription_office_00", -34.5f, 0f, -58.5f, 0f),
        new B(329, "city_anim_building_lab_00", -13f, 0f, -83f, 0f),
        new B(328, "city_building_lighthouse_00", 32f, 0f, -40f, 0f),
        new B(327, "city_building_warehouse_00", -30f, 0f, -78.5f, 0f),
        new B(326, "city_building_arena_00", 33.5f, 0f, -78.5f, 0f),
        new B(325, "city_anim_building_embassy_00", 31.5f, 0f, -96.5f, 0f),
        new B(324, "city_building_military_hospital_00", -15.5f, 0f, -56f, 0f),
        new B(323, "city_anim_building_archer_house_00", 14f, 0f, -80f, 0f),
        new B(322, "city_building_pikeman_camp_00", 35f, 0f, -57f, 0f),
        new B(321, "city_building_infantry_quarters_00", 16.5f, 0f, -56f, 0f),
        new B(319, "city_building_law_office_00", -29.5f, 0f, -41.5f, 0f),
        new B(318, "city_building_heroes_hall_00", 14.5f, 0f, -36.5f, 0f),
        new B(315, "city_building_dorm_00", -25.5f, 0f, 25f, -45f),
        new B(314, "city_building_dorm_00", -31.5f, 0f, 15.5f, -60f),
        new B(313, "city_building_dorm_00", -34.5f, 0f, 3.5f, -88f),
        new B(312, "city_building_dorm_00", -33.5f, 0f, -8.5f, -101f),
        new B(311, "city_building_dorm_00", -15f, 0f, 13f, -51.5f),
        new B(310, "city_building_dorm_00", -18.5f, 0f, 0f, -91f),
        new B(309, "city_building_dorm_00", 14.5f, 0f, 12.5f, 51f),
        new B(308, "city_building_dorm_00", 18.5f, 0f, 1f, 86f),
        new B(307, "city_building_hospital_00", -14f, 0f, 36f, -22f),
        new B(306, "city_building_kitchen_00", 0f, 0f, 21.5f, 0f),
        new B(305, "city_building_hunter_cabin_00", 10f, 0f, 36f, 17f),
        new B(304, "city_building_ironworks_00", 36f, 0f, -9.5f, 15f),
        new B(303, "city_building_coalmine_00", 37f, 0f, 8f, -10f),
        new B(302, "city_building_sawmill_00", 27f, 0f, 27f, 42f),
        new B(301, "city_building_furnace_00", 0f, 0f, 0f, 0f),
    };

    [MenuItem("Kingshot/City/Rebuild Buildings From APK Config")]
    public static void Rebuild()
    {
        ClearGenerated(false);

        GameObject root = new GameObject(ROOT_NAME);
        Undo.RegisterCreatedObjectUndo(root, "Create Kingshot city buildings");

        int created = 0;
        List<string> missing = new List<string>();

        foreach (B b in Buildings)
        {
            GameObject prefab = FindPrefab(b.model);

            if (prefab == null)
            {
                missing.Add("BID " + b.bid + " : " + b.model);
                continue;
            }

            GameObject go = PrefabUtility.InstantiatePrefab(prefab) as GameObject;
            if (go == null)
            {
                missing.Add("BID " + b.bid + " : " + b.model + " [instantiate failed]");
                continue;
            }

            Undo.RegisterCreatedObjectUndo(go, "Create " + b.model);

            go.name = b.bid + "_" + b.model;
            go.transform.SetParent(root.transform, false);
            go.transform.localPosition = b.pos;
            go.transform.localRotation = Quaternion.Euler(0f, b.angleY, 0f);
            go.transform.localScale = Vector3.one;

            created++;
        }

        Selection.activeGameObject = root;
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());

        string reportPath = "Assets/KingshotCityRebuildReport.txt";
        File.WriteAllText(reportPath,
            "KINGSHOT CITY REBUILD\n\n" +
            "Created: " + created + "\n" +
            "Missing: " + missing.Count + "\n\n" +
            string.Join("\n", missing));

        AssetDatabase.Refresh();

        Debug.Log(
            "[Kingshot] City rebuild finished. Created=" + created +
            " Missing=" + missing.Count +
            ". Report: " + reportPath);
    }

    [MenuItem("Kingshot/City/Clear Generated Buildings")]
    public static void ClearGeneratedMenu()
    {
        ClearGenerated(true);
    }

    private static void ClearGenerated(bool markDirty)
    {
        GameObject oldRoot = GameObject.Find(ROOT_NAME);
        if (oldRoot != null)
            Undo.DestroyObjectImmediate(oldRoot);

        if (markDirty)
            EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
    }

    private static GameObject FindPrefab(string wantedName)
    {
        string[] guids = AssetDatabase.FindAssets(wantedName + " t:Prefab");

        GameObject fallback = null;

        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            GameObject p = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            if (p == null)
                continue;

            if (p.name == wantedName)
                return p;

            if (fallback == null &&
                p.name.StartsWith(wantedName, System.StringComparison.OrdinalIgnoreCase))
                fallback = p;
        }

        return fallback;
    }
}
