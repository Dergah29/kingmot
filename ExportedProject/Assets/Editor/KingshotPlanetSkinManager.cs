using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System;

public static class KingshotPlanetSkinManager
{
    private const string FurnaceRootName =
        "BID_301_city_building_furnace_00";

    private const string VisualRootName =
        "KINGSHOT_FURNACE_LEVEL_VISUAL";

    [MenuItem("Tools/Kingshot/Furnace/Planet/01")]
    public static void Planet01() => SetPlanet(1);

    [MenuItem("Tools/Kingshot/Furnace/Planet/02")]
    public static void Planet02() => SetPlanet(2);

    [MenuItem("Tools/Kingshot/Furnace/Planet/03")]
    public static void Planet03() => SetPlanet(3);

    [MenuItem("Tools/Kingshot/Furnace/Planet/04")]
    public static void Planet04() => SetPlanet(4);

    [MenuItem("Tools/Kingshot/Furnace/Planet/05")]
    public static void Planet05() => SetPlanet(5);

    [MenuItem("Tools/Kingshot/Furnace/Planet/06")]
    public static void Planet06() => SetPlanet(6);

    private static void SetPlanet(int level)
    {
        if (EditorApplication.isPlaying)
        {
            Debug.LogError("KINGSHOT: Play Mode-dan cix.");
            return;
        }

        GameObject furnaceRoot =
            GameObject.Find(FurnaceRootName);

        if (furnaceRoot == null)
        {
            Debug.LogError(
                "KINGSHOT: Furnace root tapilmadi: " +
                FurnaceRootName
            );
            return;
        }

        string number = level.ToString("00");
        string prefabName =
            "exhibit_scene_planet_" + number;

        GameObject prefab =
            FindPrefab(prefabName);

        if (prefab == null)
        {
            Debug.LogError(
                "KINGSHOT: Planet prefab tapilmadi: " +
                prefabName
            );
            return;
        }

        // Hazirki visuali tap, amma bounds hesabinda onu base-e qatma.
        Transform currentVisual =
            furnaceRoot.transform.Find(
                VisualRootName
            );

        Bounds baseBounds;
        bool hasBaseBounds =
            TryGetBaseBounds(
                furnaceRoot,
                currentVisual,
                out baseBounds
            );

        RemoveCurrentVisual();

        // Original Furnace rendererlerini gizlet.
        Renderer[] baseRenderers =
            furnaceRoot.GetComponentsInChildren<Renderer>(true);

        foreach (Renderer r in baseRenderers)
        {
            Undo.RecordObject(
                r,
                "Hide Furnace Base"
            );

            r.enabled = false;
        }

        // Wrapper furnace-in tam merkezinde qalir.
        GameObject wrapper =
            new GameObject(
                VisualRootName
            );

        Undo.RegisterCreatedObjectUndo(
            wrapper,
            "Create Planet Furnace Visual"
        );

        wrapper.transform.SetParent(
            furnaceRoot.transform,
            false
        );

        wrapper.transform.localPosition =
            Vector3.zero;

        wrapper.transform.localRotation =
            Quaternion.identity;

        wrapper.transform.localScale =
            Vector3.one;

        GameObject planet =
            PrefabUtility.InstantiatePrefab(
                prefab,
                furnaceRoot.scene
            ) as GameObject;

        if (planet == null)
        {
            Undo.DestroyObjectImmediate(
                wrapper
            );

            Debug.LogError(
                "KINGSHOT: Planet instantiate olmadi."
            );
            return;
        }

        Undo.RegisterCreatedObjectUndo(
            planet,
            "Create Planet Prefab"
        );

        planet.transform.SetParent(
            wrapper.transform,
            false
        );

        planet.transform.localPosition =
            Vector3.zero;

        planet.transform.localRotation =
            Quaternion.identity;

        planet.transform.localScale =
            Vector3.one;

        Material fallback =
            FindDiffuseMaterial(
                number
            );

        RepairLocalMaterials(
            planet,
            fallback
        );

        CenterPlanetOnFurnace(
            furnaceRoot,
            planet,
            hasBaseBounds,
            baseBounds
        );

        Selection.activeGameObject =
            wrapper;

        EditorGUIUtility.PingObject(
            wrapper
        );

        if (SceneView.lastActiveSceneView != null)
            SceneView.lastActiveSceneView.FrameSelected();

        EditorSceneManager.MarkSceneDirty(
            furnaceRoot.scene
        );

        Debug.Log(
            "KINGSHOT Planet " +
            number +
            " Furnace yerine merkezlendi."
        );
    }

    private static bool TryGetBaseBounds(
        GameObject furnaceRoot,
        Transform currentVisual,
        out Bounds bounds)
    {
        Renderer[] renderers =
            furnaceRoot.GetComponentsInChildren<Renderer>(true);

        bool found = false;

        bounds =
            new Bounds(
                furnaceRoot.transform.position,
                Vector3.zero
            );

        foreach (Renderer r in renderers)
        {
            // currentVisual yoxdursa bu yoxlama edilmir.
            if (currentVisual != null &&
                r.transform.IsChildOf(currentVisual))
            {
                continue;
            }

            if (!found)
            {
                bounds = r.bounds;
                found = true;
            }
            else
            {
                bounds.Encapsulate(
                    r.bounds
                );
            }
        }

        return found;
    }

    private static void CenterPlanetOnFurnace(
        GameObject furnaceRoot,
        GameObject planet,
        bool hasBaseBounds,
        Bounds baseBounds)
    {
        Renderer[] renderers =
            planet.GetComponentsInChildren<Renderer>(true);

        bool found = false;

        Bounds planetBounds =
            new Bounds(
                planet.transform.position,
                Vector3.zero
            );

        foreach (Renderer r in renderers)
        {
            if (!r.enabled)
                continue;

            if (!found)
            {
                planetBounds = r.bounds;
                found = true;
            }
            else
            {
                planetBounds.Encapsulate(
                    r.bounds
                );
            }
        }

        if (!found)
        {
            Debug.LogWarning(
                "KINGSHOT: Planet renderer bounds tapilmadi."
            );
            return;
        }

        float targetSize = 20f;

        Vector3 targetCenter =
            furnaceRoot.transform.position;

        if (hasBaseBounds)
        {
            targetSize =
                Mathf.Max(
                    baseBounds.size.x,
                    baseBounds.size.z
                );

            targetCenter =
                baseBounds.center;
        }

        float planetSize =
            Mathf.Max(
                planetBounds.size.x,
                planetBounds.size.z
            );

        if (planetSize > 0.001f)
        {
            float scaleFactor =
                targetSize / planetSize;

            scaleFactor =
                Mathf.Clamp(
                    scaleFactor,
                    0.01f,
                    10000f
                );

            planet.transform.localScale *=
                scaleFactor;
        }

        // Scale-den sonra bounds-u tekrar hesabla.
        renderers =
            planet.GetComponentsInChildren<Renderer>(true);

        found = false;

        foreach (Renderer r in renderers)
        {
            if (!r.enabled)
                continue;

            if (!found)
            {
                planetBounds = r.bounds;
                found = true;
            }
            else
            {
                planetBounds.Encapsulate(
                    r.bounds
                );
            }
        }

        if (!found)
            return;

        Vector3 deltaWorld =
            targetCenter -
            planetBounds.center;

        planet.transform.position +=
            deltaWorld;

        Debug.Log(
            "KINGSHOT Planet align | targetSize=" +
            targetSize +
            " | planetSize=" +
            planetSize +
            " | delta=" +
            deltaWorld
        );
    }

    private static void RepairLocalMaterials(
        GameObject root,
        Material fallback)
    {
        Shader cartoon =
            Shader.Find(
                "KingshotRepair/Cartoon"
            );

        Shader transparent =
            Shader.Find(
                "KingshotRepair/Transparent"
            );

        Shader shadow =
            Shader.Find(
                "KingshotRepair/ShadowHidden"
            );

        if (cartoon == null)
        {
            Debug.LogError(
                "KINGSHOT: KingshotRepair/Cartoon tapilmadi."
            );
            return;
        }

        Renderer[] renderers =
            root.GetComponentsInChildren<Renderer>(true);

        foreach (Renderer r in renderers)
        {
            r.enabled = true;

            Material[] oldMaterials =
                r.sharedMaterials;

            if (oldMaterials == null ||
                oldMaterials.Length == 0)
            {
                oldMaterials =
                    new Material[] {
                        fallback
                    };
            }

            Material[] newMaterials =
                new Material[
                    oldMaterials.Length
                ];

            for (int i = 0;
                 i < oldMaterials.Length;
                 i++)
            {
                Material source =
                    oldMaterials[i] != null
                    ? oldMaterials[i]
                    : fallback;

                if (source == null)
                {
                    Material empty =
                        new Material(
                            cartoon
                        );

                    empty.name =
                        "KS_PLANET_EMPTY_" +
                        r.name;

                    newMaterials[i] =
                        empty;

                    continue;
                }

                Texture texture =
                    GetBestTexture(
                        source
                    );

                Color color =
                    GetBestColor(
                        source
                    );

                Material mat =
                    new Material(
                        source
                    );

                mat.name =
                    "KS_PLANET_" +
                    source.name +
                    "_" +
                    r.name;

                string objectName =
                    r.name.ToLowerInvariant();

                string shaderName =
                    source.shader != null
                    ? source.shader.name.ToLowerInvariant()
                    : "";

                if (objectName.Contains("shadow") ||
                    shaderName.Contains("shadow"))
                {
                    if (shadow != null)
                        mat.shader =
                            shadow;
                }
                else if (
                    objectName.Contains("glass") ||
                    objectName.Contains("water") ||
                    objectName.Contains("sea") ||
                    shaderName.Contains("transparent") ||
                    shaderName.Contains("alpha"))
                {
                    if (transparent != null)
                        mat.shader =
                            transparent;

                    ApplyTexture(
                        mat,
                        texture
                    );

                    ApplyColor(
                        mat,
                        color
                    );
                }
                else
                {
                    mat.shader =
                        cartoon;

                    ApplyTexture(
                        mat,
                        texture
                    );

                    ApplyColor(
                        mat,
                        color
                    );
                }

                newMaterials[i] =
                    mat;
            }

            Undo.RecordObject(
                r,
                "Repair Planet Materials"
            );

            r.sharedMaterials =
                newMaterials;

            EditorUtility.SetDirty(
                r
            );
        }
    }

    private static Texture GetBestTexture(
        Material mat)
    {
        if (mat == null)
            return null;

        string[] properties =
        {
            "_BaseMap",
            "_MainTex",
            "_BaseTex",
            "_Diffuse",
            "_DiffuseMap",
            "_Albedo",
            "_AlbedoMap",
            "_MiddleMap"
        };

        foreach (string p in properties)
        {
            if (mat.HasProperty(p))
            {
                Texture t =
                    mat.GetTexture(
                        p
                    );

                if (t != null)
                    return t;
            }
        }

        if (mat.shader != null)
        {
            int count =
                ShaderUtil.GetPropertyCount(
                    mat.shader
                );

            for (int i = 0;
                 i < count;
                 i++)
            {
                if (
                    ShaderUtil.GetPropertyType(
                        mat.shader,
                        i
                    ) ==
                    ShaderUtil.ShaderPropertyType.TexEnv)
                {
                    string prop =
                        ShaderUtil.GetPropertyName(
                            mat.shader,
                            i
                        );

                    Texture t =
                        mat.GetTexture(
                            prop
                        );

                    if (t != null)
                        return t;
                }
            }
        }

        return null;
    }

    private static Color GetBestColor(
        Material mat)
    {
        if (mat == null)
            return Color.white;

        if (mat.HasProperty("_BaseColor"))
            return mat.GetColor(
                "_BaseColor"
            );

        if (mat.HasProperty("_Color"))
            return mat.GetColor(
                "_Color"
            );

        return Color.white;
    }

    private static void ApplyTexture(
        Material mat,
        Texture tex)
    {
        if (mat == null ||
            tex == null)
            return;

        if (mat.HasProperty("_BaseMap"))
            mat.SetTexture(
                "_BaseMap",
                tex
            );

        if (mat.HasProperty("_MainTex"))
            mat.SetTexture(
                "_MainTex",
                tex
            );

        if (mat.HasProperty("_BaseTex"))
            mat.SetTexture(
                "_BaseTex",
                tex
            );
    }

    private static void ApplyColor(
        Material mat,
        Color color)
    {
        if (mat == null)
            return;

        if (mat.HasProperty("_BaseColor"))
            mat.SetColor(
                "_BaseColor",
                color
            );

        if (mat.HasProperty("_Color"))
            mat.SetColor(
                "_Color",
                color
            );
    }

    private static Material FindDiffuseMaterial(
        string number)
    {
        string exactName =
            "3d_skin_anim_exhibit_scene_planet_" +
            number +
            "_diffuse";

        string[] guids =
            AssetDatabase.FindAssets(
                "\"" +
                exactName +
                "\" t:Material"
            );

        foreach (string guid in guids)
        {
            string path =
                AssetDatabase.GUIDToAssetPath(
                    guid
                );

            Material mat =
                AssetDatabase.LoadAssetAtPath<Material>(
                    path
                );

            if (mat != null &&
                string.Equals(
                    mat.name,
                    exactName,
                    StringComparison.OrdinalIgnoreCase))
            {
                return mat;
            }
        }

        return null;
    }

    private static GameObject FindPrefab(
        string exactName)
    {
        string directPath =
            "Assets/" +
            exactName +
            ".prefab";

        GameObject direct =
            AssetDatabase.LoadAssetAtPath<GameObject>(
                directPath
            );

        if (direct != null)
            return direct;

        string[] guids =
            AssetDatabase.FindAssets(
                "\"" +
                exactName +
                "\" t:GameObject"
            );

        foreach (string guid in guids)
        {
            string path =
                AssetDatabase.GUIDToAssetPath(
                    guid
                );

            GameObject obj =
                AssetDatabase.LoadAssetAtPath<GameObject>(
                    path
                );

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

    private static void RemoveCurrentVisual()
    {
        GameObject old =
            GameObject.Find(
                VisualRootName
            );

        if (old != null)
        {
            Undo.DestroyObjectImmediate(
                old
            );
        }
    }
}
