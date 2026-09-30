using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System;
using System.Collections.Generic;
using System.IO;

public class KingshotBuildingUpgradeV19 : MonoBehaviour
{
    public int bid;
    public int level = 1;
    public int maxLevel = 1;
    public string basePrefabName = "";
    public GameObject visual;

    public bool CanUpgrade()
    {
        return level < maxLevel;
    }

    public bool UpgradeOneLevel()
    {
#if UNITY_EDITOR
        if (!CanUpgrade()) return false;

        int next = level + 1;
        string wanted = basePrefabName + "_" + next.ToString("00");

        GameObject prefab = FindExactPrefab(wanted);
        if (prefab == null)
        {
            Debug.LogWarning("KINGSHOT V19: prefab tapilmadi: " + wanted);
            return false;
        }

        if (visual != null)
            UnityEngine.Object.DestroyImmediate(visual);

        GameObject go = PrefabUtility.InstantiatePrefab(prefab, transform) as GameObject;
        if (go == null)
        {
            Debug.LogWarning("KINGSHOT V19: instantiate olmadi: " + wanted);
            return false;
        }

        go.name = wanted;
        go.transform.localPosition = Vector3.zero;
        go.transform.localRotation = Quaternion.identity;
        go.transform.localScale = Vector3.one;

        visual = go;
        level = next;

        KingshotBuildingUpgradeV19Installer.RefreshCollider(gameObject);

        EditorUtility.SetDirty(this);
        EditorSceneManager.MarkSceneDirty(gameObject.scene);

        Debug.Log("KINGSHOT V19: upgraded -> " + wanted);
        return true;
#else
        return false;
#endif
    }

#if UNITY_EDITOR
    static GameObject FindExactPrefab(string exactName)
    {
        string direct = "Assets/" + exactName + ".prefab";
        GameObject p = AssetDatabase.LoadAssetAtPath<GameObject>(direct);
        if (p != null) return p;

        foreach (string guid in AssetDatabase.FindAssets(exactName + " t:Prefab"))
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            GameObject x = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            if (x != null && string.Equals(x.name, exactName, StringComparison.OrdinalIgnoreCase))
                return x;
        }
        return null;
    }
#endif
}

public class KingshotBuildingWindowV19 : MonoBehaviour
{
    public Camera targetCamera;
    KingshotBuildingUpgradeV19 selected;
    Texture2D panelTex;

    void Start()
    {
        if (!targetCamera) targetCamera = Camera.main;
        panelTex = MakeTex(new Color(0.08f, 0.11f, 0.15f, 0.96f));
    }

    void Update()
    {
        if (!targetCamera) targetCamera = Camera.main;
        if (!targetCamera) return;

        if (Input.GetKeyDown(KeyCode.Escape))
            selected = null;

        if (!Input.GetMouseButtonDown(0))
            return;

        Ray ray = targetCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit[] hits = Physics.RaycastAll(ray, 3000f);

        KingshotBuildingUpgradeV19 found = null;

        foreach (RaycastHit hit in hits)
        {
            var x = hit.collider.GetComponentInParent<KingshotBuildingUpgradeV19>();
            if (x != null)
            {
                found = x;
                break;
            }
        }

        if (found != null)
            selected = found;
    }

    void OnGUI()
    {
        if (selected == null) return;

        float w = 500f;
        float h = 285f;
        Rect r = new Rect((Screen.width - w) / 2f, Screen.height - h - 30f, w, h);

        GUI.DrawTexture(r, panelTex);
        GUI.Box(r, "");

        GUIStyle title = new GUIStyle(GUI.skin.label);
        title.fontSize = 23;
        title.fontStyle = FontStyle.Bold;
        title.alignment = TextAnchor.MiddleCenter;

        GUIStyle center = new GUIStyle(GUI.skin.label);
        center.alignment = TextAnchor.MiddleCenter;
        center.fontSize = 16;

        string clean = CleanName(selected.basePrefabName);

        GUI.Label(new Rect(r.x + 35, r.y + 18, w - 70, 34), clean, title);
        GUI.Label(new Rect(r.x + 35, r.y + 62, w - 70, 28),
            "Level " + selected.level + " / " + selected.maxLevel, center);

        float pct = selected.maxLevel > 1
            ? (float)(selected.level - 1) / (selected.maxLevel - 1)
            : 1f;

        Rect bg = new Rect(r.x + 55, r.y + 102, w - 110, 18);
        GUI.Box(bg, "");
        Rect fill = new Rect(bg.x + 2, bg.y + 2, (bg.width - 4) * Mathf.Clamp01(pct), bg.height - 4);
        GUI.DrawTexture(fill, Texture2D.whiteTexture);

        GUI.enabled = selected.CanUpgrade();
        if (GUI.Button(new Rect(r.x + 55, r.y + 145, 390, 58),
            selected.CanUpgrade() ? "UPGRADE  →  LEVEL " + (selected.level + 1) : "MAX LEVEL"))
        {
            selected.UpgradeOneLevel();
        }
        GUI.enabled = true;

        if (GUI.Button(new Rect(r.x + 55, r.y + 216, 185, 42), "INFO"))
        {
            Debug.Log("KINGSHOT V19 INFO: BID=" + selected.bid +
                      " base=" + selected.basePrefabName +
                      " level=" + selected.level +
                      " max=" + selected.maxLevel);
        }

        if (GUI.Button(new Rect(r.x + 260, r.y + 216, 185, 42), "CLOSE"))
            selected = null;
    }

    string CleanName(string n)
    {
        if (string.IsNullOrEmpty(n)) return "Building";

        n = n.Replace("city_anim_building_", "")
             .Replace("city_building_", "")
             .Replace("_", " ");

        return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(n);
    }

    Texture2D MakeTex(Color c)
    {
        Texture2D t = new Texture2D(1, 1);
        t.SetPixel(0, 0, c);
        t.Apply();
        return t;
    }
}

public static class KingshotBuildingUpgradeV19Installer
{
    const string ROOT = "AUTO_CITY_BUILDINGS";
    const string SYSTEM = "KINGSHOT_PLAYABLE_SYSTEM";

    [MenuItem("Kingshot/City/V19/Install Click + Upgrade Window")]
    public static void Install()
    {
        if (EditorApplication.isPlaying)
        {
            EditorUtility.DisplayDialog("Kingshot V19", "Evvel Play Mode-dan cix.", "OK");
            return;
        }

        GameObject root = GameObject.Find(ROOT);
        if (root == null)
        {
            EditorUtility.DisplayDialog(
                "Kingshot V19",
                "AUTO_CITY_BUILDINGS tapilmadi.\nEvvel Kingshot > City > V3 > Rebuild Fully Built City bas.",
                "OK");
            return;
        }

        Undo.RegisterFullObjectHierarchyUndo(root, "Install Kingshot V19");

        var oldChildren = new List<Transform>();
        foreach (Transform c in root.transform)
            oldChildren.Add(c);

        int installed = 0;
        int skipped = 0;

        foreach (Transform old in oldChildren)
        {
            if (old == null) { skipped++; continue; }

            string originalName = old.name ?? "";
            string modelName = StripBid(originalName, out int bid);

            if (!TryParseLevel(modelName, out string baseName, out int level))
            {
                skipped++;
                continue;
            }

            // V19 container varsa tekrar yaratma.
            var existing = old.GetComponent<KingshotBuildingUpgradeV19>();
            if (existing != null)
            {
                existing.maxLevel = FindMaxLevel(existing.basePrefabName);
                existing.level = Mathf.Clamp(existing.level, 1, Mathf.Max(1, existing.maxLevel));
                RefreshCollider(old.gameObject);
                installed++;
                continue;
            }

            Vector3 pos = old.localPosition;
            Quaternion rot = old.localRotation;
            Vector3 scale = old.localScale;
            int sibling = old.GetSiblingIndex();

            GameObject holder = new GameObject(originalName);
            Undo.RegisterCreatedObjectUndo(holder, "Create building holder");

            holder.transform.SetParent(root.transform, false);
            holder.transform.localPosition = pos;
            holder.transform.localRotation = rot;
            holder.transform.localScale = scale;
            holder.transform.SetSiblingIndex(Mathf.Min(sibling, root.transform.childCount - 1));

            // Existing prefab visual holder altina kecir.
            old.SetParent(holder.transform, true);
            old.localPosition = Vector3.zero;
            old.localRotation = Quaternion.identity;
            old.localScale = Vector3.one;

            var up = Undo.AddComponent<KingshotBuildingUpgradeV19>(holder);
            up.bid = bid;
            up.level = level;
            up.basePrefabName = baseName;
            up.maxLevel = FindMaxLevel(baseName);
            up.visual = old.gameObject;

            RefreshCollider(holder);

            EditorUtility.SetDirty(up);
            installed++;
        }

        GameObject sys = GameObject.Find(SYSTEM);
        if (sys == null)
        {
            sys = new GameObject(SYSTEM);
            Undo.RegisterCreatedObjectUndo(sys, "Create Kingshot playable system");
        }

        var window = sys.GetComponent<KingshotBuildingWindowV19>();
        if (window == null)
            window = Undo.AddComponent<KingshotBuildingWindowV19>(sys);

        Camera cam = FindCityCamera();
        window.targetCamera = cam;

        if (cam != null)
        {
            cam.gameObject.SetActive(true);
            cam.enabled = true;
        }

        EditorUtility.SetDirty(sys);
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());

        EditorUtility.DisplayDialog(
            "Kingshot V19",
            "Hazirdir.\nInstalled: " + installed +
            "\nSkipped: " + skipped +
            "\n\nPLAY bas -> binaya klik et -> UPGRADE.",
            "OK");
    }

    [MenuItem("Kingshot/City/V19/Refresh Building Colliders")]
    public static void RefreshAll()
    {
        GameObject root = GameObject.Find(ROOT);
        if (root == null) return;

        foreach (Transform b in root.transform)
            RefreshCollider(b.gameObject);

        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        Debug.Log("KINGSHOT V19: colliderler yenilendi.");
    }

    public static void RefreshCollider(GameObject building)
    {
        if (building == null) return;

        Bounds? bounds = GetVisibleBounds(building.transform);
        if (!bounds.HasValue) return;

        BoxCollider bc = building.GetComponent<BoxCollider>();
        if (bc == null)
            bc = building.AddComponent<BoxCollider>();

        Bounds wb = bounds.Value;
        bc.center = building.transform.InverseTransformPoint(wb.center);

        Vector3 lossy = building.transform.lossyScale;
        bc.size = new Vector3(
            SafeDiv(wb.size.x, Mathf.Abs(lossy.x)),
            SafeDiv(wb.size.y, Mathf.Abs(lossy.y)),
            SafeDiv(wb.size.z, Mathf.Abs(lossy.z))
        );

        EditorUtility.SetDirty(bc);
    }

    static Bounds? GetVisibleBounds(Transform root)
    {
        Renderer[] rs = root.GetComponentsInChildren<Renderer>(true);
        bool found = false;
        Bounds b = new Bounds();

        foreach (Renderer r in rs)
        {
            if (r == null || !r.enabled || !r.gameObject.activeInHierarchy)
                continue;

            string n = r.name.ToLowerInvariant();
            if (n.Contains("shadow") || n.Contains("_low"))
                continue;

            Bounds rb = r.bounds;
            if (rb.size.sqrMagnitude < 0.000001f)
                continue;

            if (!found)
            {
                b = rb;
                found = true;
            }
            else
            {
                b.Encapsulate(rb);
            }
        }

        return found ? b : (Bounds?)null;
    }

    static float SafeDiv(float a, float b)
    {
        return b > 0.0001f ? a / b : a;
    }

    static Camera FindCityCamera()
    {
        GameObject go = GameObject.Find("SceneRoot/MapRoot/CameraRoot/CameraZoom/Camera");
        if (go != null)
        {
            Camera c = go.GetComponent<Camera>();
            if (c != null) return c;
        }

        if (Camera.main != null)
            return Camera.main;

        Camera[] all = Resources.FindObjectsOfTypeAll<Camera>();
        foreach (Camera c in all)
        {
            if (c != null && c.gameObject.scene.IsValid())
                return c;
        }

        return null;
    }

    static string StripBid(string name, out int bid)
    {
        bid = 0;

        int first = name.IndexOf('_');
        if (first > 0)
        {
            int.TryParse(name.Substring(0, first), out bid);
            return name.Substring(first + 1);
        }

        return name;
    }

    static bool TryParseLevel(string modelName, out string baseName, out int level)
    {
        baseName = "";
        level = 1;

        if (string.IsNullOrEmpty(modelName))
            return false;

        int idx = modelName.LastIndexOf('_');
        if (idx <= 0 || idx >= modelName.Length - 1)
            return false;

        string tail = modelName.Substring(idx + 1);
        if (!int.TryParse(tail, out level))
            return false;

        baseName = modelName.Substring(0, idx);
        return !string.IsNullOrEmpty(baseName);
    }

    static int FindMaxLevel(string baseName)
    {
        int max = 1;
        string prefix = baseName + "_";

        foreach (string guid in AssetDatabase.FindAssets("t:Prefab"))
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            if (string.IsNullOrEmpty(path)) continue;

            string file = Path.GetFileNameWithoutExtension(path);
            if (string.IsNullOrEmpty(file)) continue;
            if (!file.StartsWith(prefix, StringComparison.OrdinalIgnoreCase)) continue;

            string tail = file.Substring(prefix.Length);
            if (int.TryParse(tail, out int lv))
                max = Mathf.Max(max, lv);
        }

        return max;
    }
}
