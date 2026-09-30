using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System.Collections.Generic;

public static class KingshotCityFireCrystalV2
{
    private class Swap
    {
        public int bid;
        public string prefabPath;
        public Swap(int bid, string prefabPath) { this.bid = bid; this.prefabPath = prefabPath; }
    }

    // Paths confirmed by KingshotBuildingVariants.txt.
    // Highest visible FC stage is used as a PREVIEW where multiple stages exist.
    private static readonly Swap[] Swaps =
    {
        new Swap(301, "Assets/3d_city_building_firecrystal_furnace_10.prefab"),
        new Swap(321, "Assets/3d_city_building_firecrystal_infantry_quarters_08.prefab"),
        new Swap(322, "Assets/3d_city_building_firecrystal_pikeman_camp_08.prefab"),
        new Swap(323, "Assets/3d_city_building_firecrystal_archer_house_08.prefab"),
        new Swap(324, "Assets/3d_city_building_firecrystal_military_hospital_01.prefab"),
        new Swap(331, "Assets/3d_city_building_firecrystal_command_01.prefab"),
        new Swap(325, "Assets/3d_city_building_firecrystal_embassy_01.prefab"),
        new Swap(336, "Assets/3d_city_building_firecrystal_alchemist_workshop_01.prefab"),
        new Swap(337, "Assets/3d_city_building_firecrystal_wra_cademy_01.prefab")
    };

    [MenuItem("Kingshot/City/V2/Apply Fire Crystal Preview")]
    public static void Apply()
    {
        GameObject root = GameObject.Find("AUTO_CITY_BUILDINGS");
        if (root == null)
        {
            EditorUtility.DisplayDialog("Kingshot",
                "AUTO_CITY_BUILDINGS tapilmadi. Evvel Rebuild Buildings From APK Config et.",
                "OK");
            return;
        }

        int replaced = 0;
        List<string> missing = new List<string>();

        foreach (Swap s in Swaps)
        {
            Transform old = FindBid(root.transform, s.bid);
            if (old == null)
            {
                missing.Add("BID " + s.bid + " scene slot not found");
                continue;
            }

            GameObject prefab = AssetDatabase.LoadAssetAtPath<GameObject>(s.prefabPath);
            if (prefab == null)
            {
                missing.Add("BID " + s.bid + " prefab missing: " + s.prefabPath);
                continue;
            }

            Vector3 pos = old.localPosition;
            Quaternion rot = old.localRotation;
            Vector3 scale = old.localScale;
            int sibling = old.GetSiblingIndex();

            Undo.DestroyObjectImmediate(old.gameObject);

            GameObject go = PrefabUtility.InstantiatePrefab(prefab) as GameObject;
            if (go == null)
            {
                missing.Add("BID " + s.bid + " instantiate failed");
                continue;
            }

            Undo.RegisterCreatedObjectUndo(go, "FC swap");
            go.name = s.bid + "_" + prefab.name;
            go.transform.SetParent(root.transform, false);
            go.transform.localPosition = pos;
            go.transform.localRotation = rot;
            go.transform.localScale = scale;
            go.transform.SetSiblingIndex(Mathf.Min(sibling, root.transform.childCount - 1));
            replaced++;
        }

        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());

        Debug.Log("[Kingshot V2] Fire Crystal preview applied. Replaced=" +
                  replaced + " Missing=" + missing.Count +
                  (missing.Count > 0 ? "\n" + string.Join("\n", missing) : ""));
    }

    private static Transform FindBid(Transform root, int bid)
    {
        string prefix = bid + "_";
        foreach (Transform child in root)
            if (child.name.StartsWith(prefix))
                return child;
        return null;
    }
}
