using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotOriginalBuildingUIV19
{
    [MenuItem("Kingshot/City/V19/Use Real Building Info Panel")]
    public static void Install()
    {
        const string path = "Assets/BuildingInfoPanel.prefab";
        GameObject prefab = AssetDatabase.LoadAssetAtPath<GameObject>(path);
        if (!prefab) {
            EditorUtility.DisplayDialog("V19","BuildingInfoPanel tapilmadi:\n"+path,"OK");
            return;
        }

        GameObject uiRoot = GameObject.Find("KINGSHOT_ORIGINAL_UI");
        if (!uiRoot) uiRoot = new GameObject("KINGSHOT_ORIGINAL_UI");

        Transform old = FindDeep(uiRoot.transform, "OriginalBuildingWindow");
        if (old) Undo.DestroyObjectImmediate(old.gameObject);

        GameObject win = (GameObject)PrefabUtility.InstantiatePrefab(prefab, uiRoot.transform);
        if (!win) {
            EditorUtility.DisplayDialog("V19","BuildingInfoPanel instantiate olunmadi.","OK");
            return;
        }
        win.name = "OriginalBuildingWindow";
        win.SetActive(false);

        GameObject sys = GameObject.Find("KINGSHOT_PLAYABLE_SYSTEM");
        if (!sys) sys = new GameObject("KINGSHOT_PLAYABLE_SYSTEM");

        var binder = sys.GetComponent<KingshotOriginalUIBinderV18Runtime>();
        if (!binder) binder = Undo.AddComponent<KingshotOriginalUIBinderV18Runtime>(sys);
        if (!binder) {
            EditorUtility.DisplayDialog("V19","V18 Runtime script tapilmadi/elave olunmadi.","OK");
            return;
        }

        binder.buildingWindow = win;
        binder.targetCamera = Camera.main ? Camera.main : Object.FindObjectOfType<Camera>(true);

        EditorUtility.SetDirty(binder);
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        Selection.activeGameObject = win;

        EditorUtility.DisplayDialog("V19",
            "Original BuildingInfoPanel qosuldu.\nPLAY bas ve binaya klik et.","OK");
    }

    static Transform FindDeep(Transform r,string n) {
        if (!r) return null;
        if (r.name==n) return r;
        foreach(Transform c in r) { var x=FindDeep(c,n); if(x) return x; }
        return null;
    }
}
