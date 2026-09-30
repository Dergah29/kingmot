using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public class KingshotBuildingUpgradeV15Safe : MonoBehaviour
{
    public int level = 1;
    public int maxLevel = 12;
    public string basePrefabName = "";
    public GameObject visual;
}

public static class KingshotUpgradeInstallerV15Safe
{
    [MenuItem("Kingshot/City/V15 SAFE/Install Upgrade Components")]
    public static void Install()
    {
        GameObject root = GameObject.Find("AUTO_CITY_BUILDINGS");
        if (root == null) {
            EditorUtility.DisplayDialog("V15 SAFE","AUTO_CITY_BUILDINGS tapilmadi.","OK");
            return;
        }

        int installed = 0, skipped = 0;

        foreach (Transform b in root.transform)
        {
            if (b == null || b.gameObject == null) { skipped++; continue; }

            string n = b.name ?? "";
            int first = n.IndexOf('_');
            if (first >= 0 && first + 1 < n.Length) n = n.Substring(first + 1);

            int cut = n.LastIndexOf("_01");
            if (cut <= 0) { skipped++; continue; }

            string baseName = n.Substring(0, cut);

            var up = b.gameObject.GetComponent<KingshotBuildingUpgradeV15Safe>();
            if (up == null)
                up = Undo.AddComponent<KingshotBuildingUpgradeV15Safe>(b.gameObject);

            // AddComponent can fail on a broken/missing-script object; never dereference it.
            if (up == null) {
                Debug.LogWarning("V15 SAFE skipped broken object: " + b.name, b.gameObject);
                skipped++;
                continue;
            }

            up.level = 1;
            up.basePrefabName = baseName;
            up.visual = b.childCount > 0 ? b.GetChild(0).gameObject : null;
            up.maxLevel = FindMaxLevel(baseName);
            EditorUtility.SetDirty(up);
            installed++;
        }

        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        EditorUtility.DisplayDialog("V15 SAFE",
            "Hazirdir.\nInstalled: " + installed + "\nSkipped: " + skipped,
            "OK");
    }

    static int FindMaxLevel(string baseName)
    {
        int max = 1;
        if (string.IsNullOrEmpty(baseName)) return max;

        string prefix = baseName + "_";
        foreach (string guid in AssetDatabase.FindAssets("t:Prefab"))
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            if (string.IsNullOrEmpty(path)) continue;

            string file = System.IO.Path.GetFileNameWithoutExtension(path);
            if (string.IsNullOrEmpty(file) || !file.StartsWith(prefix)) continue;

            string tail = file.Substring(prefix.Length);
            if (int.TryParse(tail, out int lv))
                max = Mathf.Max(max, lv);
        }
        return max;
    }
}
