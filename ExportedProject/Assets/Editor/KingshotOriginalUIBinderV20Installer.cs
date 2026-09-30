using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotOriginalUIBinderV20Installer
{
    [MenuItem("Kingshot/City/V20/Fix And Open Original Building UI")]
    public static void Install()
    {
        GameObject ui = GameObject.Find("KINGSHOT_ORIGINAL_UI");
        if (!ui) { EditorUtility.DisplayDialog("V20","KINGSHOT_ORIGINAL_UI tapilmadi.","OK"); return; }

        Transform win = Find(ui.transform,"OriginalBuildingWindow");
        if (!win) { EditorUtility.DisplayDialog("V20","OriginalBuildingWindow tapilmadi. V19-u evvel islet.","OK"); return; }

        GameObject sys = GameObject.Find("KINGSHOT_PLAYABLE_SYSTEM");
        if (!sys) sys = new GameObject("KINGSHOT_PLAYABLE_SYSTEM");

        // Disable older binders so only V20 handles the click.
        foreach (var mb in sys.GetComponents<MonoBehaviour>())
            if (mb && mb.GetType().Name.Contains("OriginalUIBinder") && mb.GetType() != typeof(KingshotOriginalUIBinderV20Runtime))
                mb.enabled = false;

        var b = sys.GetComponent<KingshotOriginalUIBinderV20Runtime>();
        if (!b) b = Undo.AddComponent<KingshotOriginalUIBinderV20Runtime>(sys);
        if (!b) { EditorUtility.DisplayDialog("V20","V20 Runtime elave olunmadi. Runtime fayli Assets kokunde olmalidir.","OK"); return; }

        b.buildingWindow = win.gameObject;
        win.gameObject.SetActive(false);

        EditorUtility.SetDirty(b);
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        EditorUtility.DisplayDialog("V20","Hazirdir. PLAY bas, binaya sol klik et.","OK");
    }

    static Transform Find(Transform r,string n)
    {
        if (r.name==n) return r;
        foreach(Transform c in r){ var x=Find(c,n); if(x) return x; }
        return null;
    }
}
