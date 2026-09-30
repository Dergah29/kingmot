using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotOriginalUIBinderV18Installer
{
    [MenuItem("Kingshot/City/V18 FIX/Bind Original UI")]
    public static void Install() {
        var uiRoot = GameObject.Find("KINGSHOT_ORIGINAL_UI");
        if (!uiRoot) { EditorUtility.DisplayDialog("V18 FIX","KINGSHOT_ORIGINAL_UI tapilmadi.","OK"); return; }

        Transform win = Find(uiRoot.transform, "OriginalBuildingWindow");
        if (!win) { EditorUtility.DisplayDialog("V18 FIX","OriginalBuildingWindow tapilmadi.","OK"); return; }

        var sys = GameObject.Find("KINGSHOT_PLAYABLE_SYSTEM");
        if (!sys) sys = new GameObject("KINGSHOT_PLAYABLE_SYSTEM");

        var b = sys.GetComponent<KingshotOriginalUIBinderV18Runtime>();
        if (!b) b = Undo.AddComponent<KingshotOriginalUIBinderV18Runtime>(sys);
        if (!b) { EditorUtility.DisplayDialog("V18 FIX","Runtime component elave olunmadi.","OK"); return; }

        b.buildingWindow = win.gameObject;
        b.targetCamera = Camera.main ? Camera.main : Object.FindObjectOfType<Camera>(true);
        win.gameObject.SetActive(false);

        EditorUtility.SetDirty(b);
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        EditorUtility.DisplayDialog("V18 FIX","Hazirdir. PLAY bas ve binaya klik et.","OK");
    }

    static Transform Find(Transform r,string n) {
        if (r.name==n) return r;
        foreach(Transform c in r) { var x=Find(c,n); if(x) return x; }
        return null;
    }
}