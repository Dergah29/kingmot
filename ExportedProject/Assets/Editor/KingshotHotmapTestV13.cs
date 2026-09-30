using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

public static class KingshotHotmapTestV13
{
    const string PATH = "SceneRoot/MapRoot/City/HotmapPlane";

    [MenuItem("Kingshot/City/V13/Test Disable HotmapPlane")]
    public static void Disable()
    {
        GameObject go = GameObject.Find(PATH);
        if (!go) {
            EditorUtility.DisplayDialog("Kingshot V13","HotmapPlane tapilmadi.","OK");
            return;
        }

        Renderer[] rs = go.GetComponentsInChildren<Renderer>(true);
        int count=0;
        foreach(Renderer r in rs) {
            if(!r.enabled) continue;
            Undo.RecordObject(r,"Disable HotmapPlane renderer");
            r.enabled=false;
            EditorUtility.SetDirty(r);
            count++;
        }

        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        SceneView.RepaintAll();
        Debug.Log("[Kingshot V13] HotmapPlane renderers disabled: "+count);
        EditorUtility.DisplayDialog("Kingshot V13",
            "HotmapPlane test ucun sonduruldu.\nRenderer: "+count+
            "\nIndi qara lekelerin deyisib-deyismediyine bax.","OK");
    }

    [MenuItem("Kingshot/City/V13/Restore HotmapPlane")]
    public static void Restore()
    {
        GameObject go = GameObject.Find(PATH);
        if (!go) {
            EditorUtility.DisplayDialog("Kingshot V13","HotmapPlane tapilmadi.","OK");
            return;
        }

        Renderer[] rs = go.GetComponentsInChildren<Renderer>(true);
        int count=0;
        foreach(Renderer r in rs) {
            if(r.enabled) continue;
            Undo.RecordObject(r,"Restore HotmapPlane renderer");
            r.enabled=true;
            EditorUtility.SetDirty(r);
            count++;
        }

        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        SceneView.RepaintAll();
        Debug.Log("[Kingshot V13] HotmapPlane renderers restored: "+count);
    }
}
