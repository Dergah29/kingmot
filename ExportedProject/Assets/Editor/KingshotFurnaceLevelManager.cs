using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System;
using System.Collections.Generic;

public static class KingshotFurnaceLevelManager
{
    private const string FurnaceRootName =
        "BID_301_city_building_furnace_00";

    private const string VisualRootName =
        "KINGSHOT_FURNACE_LEVEL_VISUAL";


    // =====================================================
    // NORMAL
    // =====================================================

    [MenuItem("Tools/Kingshot/Furnace/Normal/01")]
    public static void Normal01() => SetNormal(1);

    [MenuItem("Tools/Kingshot/Furnace/Normal/02")]
    public static void Normal02() => SetNormal(2);

    [MenuItem("Tools/Kingshot/Furnace/Normal/03")]
    public static void Normal03() => SetNormal(3);

    [MenuItem("Tools/Kingshot/Furnace/Normal/04")]
    public static void Normal04() => SetNormal(4);

    [MenuItem("Tools/Kingshot/Furnace/Normal/05")]
    public static void Normal05() => SetNormal(5);

    [MenuItem("Tools/Kingshot/Furnace/Normal/06")]
    public static void Normal06() => SetNormal(6);

    [MenuItem("Tools/Kingshot/Furnace/Normal/07")]
    public static void Normal07() => SetNormal(7);

    [MenuItem("Tools/Kingshot/Furnace/Normal/08")]
    public static void Normal08() => SetNormal(8);

    [MenuItem("Tools/Kingshot/Furnace/Normal/09")]
    public static void Normal09() => SetNormal(9);

    [MenuItem("Tools/Kingshot/Furnace/Normal/10")]
    public static void Normal10() => SetNormal(10);

    [MenuItem("Tools/Kingshot/Furnace/Normal/11")]
    public static void Normal11() => SetNormal(11);

    [MenuItem("Tools/Kingshot/Furnace/Normal/12")]
    public static void Normal12() => SetNormal(12);


    // =====================================================
    // FIRE CRYSTAL
    // =====================================================

    [MenuItem("Tools/Kingshot/Furnace/Fire Crystal/01")]
    public static void FC01() => SetFireCrystal(1);

    [MenuItem("Tools/Kingshot/Furnace/Fire Crystal/04")]
    public static void FC04() => SetFireCrystal(4);

    [MenuItem("Tools/Kingshot/Furnace/Fire Crystal/05")]
    public static void FC05() => SetFireCrystal(5);

    [MenuItem("Tools/Kingshot/Furnace/Fire Crystal/06")]
    public static void FC06() => SetFireCrystal(6);

    [MenuItem("Tools/Kingshot/Furnace/Fire Crystal/07")]
    public static void FC07() => SetFireCrystal(7);

    [MenuItem("Tools/Kingshot/Furnace/Fire Crystal/08")]
    public static void FC08() => SetFireCrystal(8);

    [MenuItem("Tools/Kingshot/Furnace/Fire Crystal/09")]
    public static void FC09() => SetFireCrystal(9);

    [MenuItem("Tools/Kingshot/Furnace/Fire Crystal/10")]
    public static void FC10() => SetFireCrystal(10);


    // =====================================================
    // PLANET
    // =====================================================

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


    // =====================================================
    // NORMAL
    // =====================================================

    private static void SetNormal(int level)
    {
        string number = level.ToString("00");

        string baseName =
            "3d_city_building_furnace_" + number;

        LoadVariant(baseName);
    }


    // =====================================================
    // FIRE CRYSTAL
    // =====================================================

    private static void SetFireCrystal(int level)
    {
        string number = level.ToString("00");

        string prefabName =
            "3d_city_building_firecrystal_furnace_" + number;

        GameObject visual =
            CreateVisual(prefabName);

        if (visual == null)
            return;

        Material mainMat =
            AssetDatabase.LoadAssetAtPath<Material>(
                "Assets/m_city_building_firecrystal_furnace_" +
                number + ".mat"
            );

        Material fcMat =
            AssetDatabase.LoadAssetAtPath<Material>(
                "Assets/m_city_building_firecrystal_furnace_" +
                number + "_fc.mat"
            );

        Texture2D mainTex =
            AssetDatabase.LoadAssetAtPath<Texture2D>(
                "Assets/t_city_building_firecrystal_furnace_" +
                number + ".png"
            );

        Texture2D fcTex =
            AssetDatabase.LoadAssetAtPath<Texture2D>(
                "Assets/t_city_building_firecrystal_furnace_" +
                number + "_fc.png"
            );

        ApplyFireCrystalMaterials(
            visual,
            mainMat,
            fcMat,
            mainTex,
            fcTex
        );

        FinishVisual(
            visual,
            "KINGSHOT Fire Crystal " + number + " hazirdir."
        );
    }


    // =====================================================
    // PLANET
    // =====================================================



    private static readonly string[] FrozenPlanetModels =
    {
        "skin_anim_building_furnace_frozenplanet",
        "skin_anim_building_furnace_frozenplanet_LV2",
        "skin_anim_building_furnace_frozenplanet_LV3",
        "skin_anim_building_furnace_frozenplanet_LV4",
        "skin_anim_building_furnace_frozenplanet_LV5",
        "skin_anim_building_furnace_frozenplanet_LV6"
    };

    private static void SetPlanet(int level)
    {
        if (level < 1 || level > FrozenPlanetModels.Length)
        {
            Debug.LogError(
                "KINGSHOT: Frozen Planet level yanlisdir: " +
                level
            );
            return;
        }

        string prefabName =
            FrozenPlanetModels[level - 1];

        GameObject visual =
            CreateVisual(prefabName);

        if (visual == null)
            return;

        RepairFrozenPlanetMaterials(
            visual
        );

        FinishVisual(
            visual,
            "KINGSHOT Frozen Planet LV" +
            level +
            " yuklendi: " +
            prefabName
        );
    }


    // =====================================================
    // LOAD NORMAL VARIANT
    // =====================================================

    private static void LoadVariant(
        string baseName)
    {
        GameObject visual =
            CreateVisual(baseName);

        if (visual == null)
            return;

        Material sourceMaterial =
            FindMaterial(baseName);

        Texture2D texture =
            FindTexture(baseName);

        ApplyMaterials(
            visual,
            sourceMaterial,
            texture
        );

        FinishVisual(
            visual,
            "KINGSHOT Furnace loaded: " +
            baseName
        );
    }


    // =====================================================
    // CREATE NORMAL / FIRE CRYSTAL VISUAL
    // =====================================================

    private static GameObject CreateVisual(
        string prefabName)
    {
        if (EditorApplication.isPlaying)
        {
            Debug.LogError(
                "KINGSHOT: Play Mode-dan cix."
            );

            return null;
        }

        GameObject furnaceRoot =
            GetFurnaceRoot();

        if (furnaceRoot == null)
            return null;

        GameObject prefab =
            FindPrefab(prefabName);

        if (prefab == null)
        {
            Debug.LogError(
                "KINGSHOT: Prefab tapilmadi: " +
                prefabName
            );

            return null;
        }

        RemoveCurrentVisual();

        HideBaseFurnaceRenderers(
            furnaceRoot
        );

        GameObject obj =
            PrefabUtility.InstantiatePrefab(
                prefab,
                furnaceRoot.scene
            ) as GameObject;

        if (obj == null)
        {
            Debug.LogError(
                "KINGSHOT: Instantiate olmadi: " +
                prefabName
            );

            return null;
        }

        Undo.RegisterCreatedObjectUndo(
            obj,
            "Create Furnace Variant"
        );

        obj.name =
            VisualRootName;

        obj.transform.SetParent(
            furnaceRoot.transform,
            false
        );

        obj.transform.localPosition =
            Vector3.zero;

        obj.transform.localRotation =
            Quaternion.identity;

        obj.transform.localScale =
            Vector3.one;

        // Export olunan skin prefablarinin layer-i Game kamerada gorunmeye biler.
        // Furnace-in layer-ini butun child-lara kocururuk.
        SetLayerRecursively(
            obj,
            furnaceRoot.layer
        );

        // Frozen Planet-in yuxari hisseleri Animator/bone ile yerlesir.
        // Edit mode-da default state-i bir defe evaluate edirik.
        EvaluateAnimators(
            obj
        );

        return obj;
    }


    // =====================================================
    // FURNACE ROOT / BASE
    // =====================================================

    private static GameObject GetFurnaceRoot()
    {
        GameObject furnaceRoot =
            GameObject.Find(
                FurnaceRootName
            );

        if (furnaceRoot == null)
        {
            Debug.LogError(
                "KINGSHOT: " +
                FurnaceRootName +
                " tapilmadi."
            );
        }

        return furnaceRoot;
    }

    private static void HideBaseFurnaceRenderers(
        GameObject furnaceRoot)
    {
        Renderer[] existing =
            furnaceRoot.GetComponentsInChildren<Renderer>(
                true
            );

        Transform visual =
            furnaceRoot.transform.Find(
                VisualRootName
            );

        foreach (Renderer r in existing)
        {
            if (visual != null &&
                (r.transform == visual ||
                 r.transform.IsChildOf(visual)))
            {
                continue;
            }

            Undo.RecordObject(
                r,
                "Hide Base Furnace"
            );

            r.enabled = false;
        }
    }

    private static bool TryGetFurnaceBaseBounds(
        GameObject furnaceRoot,
        Transform visualToIgnore,
        out Bounds bounds)
    {
        Renderer[] renderers =
            furnaceRoot.GetComponentsInChildren<Renderer>(
                true
            );

        bool found = false;

        bounds =
            new Bounds(
                furnaceRoot.transform.position,
                Vector3.zero
            );

        foreach (Renderer r in renderers)
        {
            if (visualToIgnore != null &&
                (r.transform == visualToIgnore ||
                 r.transform.IsChildOf(visualToIgnore)))
            {
                continue;
            }

            // Particle effectler Furnace-in real footprintunu pozmasin.
            if (r is ParticleSystemRenderer)
                continue;

            Bounds b =
                r.bounds;

            if (b.size.sqrMagnitude <
                0.000001f)
            {
                continue;
            }

            if (!found)
            {
                bounds = b;
                found = true;
            }
            else
            {
                bounds.Encapsulate(
                    b
                );
            }
        }

        return found;
    }


    // =====================================================
    // FROZEN PLANET MATERIAL REPAIR
    // =====================================================


    private static void RepairFrozenPlanetMaterials(
        GameObject root)
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
            root.GetComponentsInChildren<Renderer>(
                true
            );

        foreach (Renderer renderer in renderers)
        {
            Material[] sourceMaterials =
                renderer.sharedMaterials;

            if (sourceMaterials == null ||
                sourceMaterials.Length == 0)
            {
                renderer.enabled = true;
                continue;
            }

            Material[] repaired =
                new Material[
                    sourceMaterials.Length
                ];

            for (int i = 0;
                 i < sourceMaterials.Length;
                 i++)
            {
                Material source =
                    sourceMaterials[i];

                if (source == null)
                {
                    repaired[i] = null;
                    continue;
                }

                string shaderName =
                    source.shader != null
                        ? source.shader.name
                        : "";

                string shaderLower =
                    shaderName.ToLowerInvariant();

                string objectLower =
                    renderer.name.ToLowerInvariant();

                string materialLower =
                    source.name.ToLowerInvariant();

                bool alreadyRepairShader =
                    shaderName.StartsWith(
                        "KingshotRepair/",
                        StringComparison.OrdinalIgnoreCase
                    );

                bool brokenOrGameShader =
                    string.IsNullOrEmpty(shaderName) ||
                    shaderLower.Contains(
                        "internalerrorshader"
                    ) ||
                    shaderName.StartsWith(
                        "DianDian/",
                        StringComparison.OrdinalIgnoreCase
                    );

                if (alreadyRepairShader ||
                    !brokenOrGameShader)
                {
                    repaired[i] = source;
                    continue;
                }

                Texture bestTexture =
                    GetBestTexture(
                        source
                    );

                if (bestTexture == null)
                {
                    bestTexture =
                        FindTextureForMaterial(
                            source.name
                        );
                }

                Color bestColor =
                    GetBestColor(
                        source
                    );

                Material mat =
                    new Material(
                        source
                    );

                mat.name =
                    "KS_PLANET_" +
                    source.name;

                bool isShadow =
                    objectLower.Contains("shadow") ||
                    materialLower.Contains("shadow");

                bool isTransparent =
                    objectLower.Contains("glass") ||
                    materialLower.Contains("glass") ||
                    objectLower.Contains("smoke") ||
                    materialLower.Contains("smoke") ||
                    objectLower.Contains("fx") ||
                    materialLower.Contains("fx") ||
                    shaderLower.Contains("bottle") ||
                    shaderLower.Contains("transparent") ||
                    shaderLower.Contains("additive") ||
                    shaderLower.Contains("alpha");

                if (isShadow &&
                    shadow != null)
                {
                    mat.shader =
                        shadow;
                }
                else if (isTransparent &&
                         transparent != null)
                {
                    mat.shader =
                        transparent;

                    ApplyTexture(
                        mat,
                        bestTexture
                    );

                    ApplyColor(
                        mat,
                        bestColor
                    );
                }
                else
                {
                    mat.shader =
                        cartoon;

                    ApplyTexture(
                        mat,
                        bestTexture
                    );

                    ApplyColor(
                        mat,
                        bestColor
                    );
                }

                repaired[i] =
                    mat;
            }

            Undo.RecordObject(
                renderer,
                "Repair Frozen Planet Material"
            );

            renderer.sharedMaterials =
                repaired;

            renderer.enabled =
                true;

            EditorUtility.SetDirty(
                renderer
            );
        }

        EditorSceneManager.MarkSceneDirty(
            root.scene
        );
    }


    // =====================================================
    // FIRE CRYSTAL MATERIALS
    // =====================================================

    private static void ApplyFireCrystalMaterials(
        GameObject root,
        Material mainMat,
        Material fcMat,
        Texture2D mainTex,
        Texture2D fcTex)
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
            root.GetComponentsInChildren<Renderer>(
                true
            );

        foreach (Renderer r in renderers)
        {
            Undo.RecordObject(
                r,
                "Apply Fire Crystal Furnace Material"
            );

            string n =
                r.name.ToLowerInvariant();

            bool useFc =
                n.Contains("_fc") ||
                n.Contains("crystal");

            Material source =
                useFc && fcMat != null
                    ? fcMat
                    : mainMat;

            Material mat;

            if (source != null)
                mat = new Material(source);
            else
                mat = new Material(cartoon);

            mat.name =
                "KS_FC_" +
                r.name;

            if (n.Contains("shadow"))
            {
                if (shadow != null)
                    mat.shader = shadow;
            }
            else if (n.Contains("glass"))
            {
                if (transparent != null)
                    mat.shader = transparent;

                ApplyTexture(
                    mat,
                    useFc &&
                    fcTex != null
                        ? fcTex
                        : mainTex
                );
            }
            else
            {
                mat.shader =
                    cartoon;

                ApplyTexture(
                    mat,
                    useFc &&
                    fcTex != null
                        ? fcTex
                        : mainTex
                );
            }

            r.sharedMaterial =
                mat;

            r.enabled =
                true;

            EditorUtility.SetDirty(
                r
            );
        }
    }


    // =====================================================
    // NORMAL MATERIALS
    // =====================================================

    private static void ApplyMaterials(
        GameObject root,
        Material sourceMaterial,
        Texture2D texture)
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
            root.GetComponentsInChildren<Renderer>(
                true
            );

        foreach (Renderer renderer in renderers)
        {
            Undo.RecordObject(
                renderer,
                "Apply Furnace Material"
            );

            string n =
                renderer.name.ToLowerInvariant();

            Material mat;

            if (sourceMaterial != null)
            {
                mat =
                    new Material(
                        sourceMaterial
                    );
            }
            else
            {
                mat =
                    new Material(
                        cartoon
                    );
            }

            mat.name =
                "KS_" +
                renderer.name;

            if (n.Contains("shadow"))
            {
                if (shadow != null)
                    mat.shader =
                        shadow;
            }
            else if (n.Contains("glass"))
            {
                if (transparent != null)
                    mat.shader =
                        transparent;

                ApplyTexture(
                    mat,
                    texture
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
            }

            renderer.sharedMaterial =
                mat;

            renderer.enabled =
                true;

            EditorUtility.SetDirty(
                renderer
            );
        }
    }


    // =====================================================
    // PLANET MATERIALS
    // =====================================================

    private static void RepairPlanetMaterials(
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
            root.GetComponentsInChildren<Renderer>(
                true
            );

        foreach (Renderer renderer in renderers)
        {
            Undo.RecordObject(
                renderer,
                "Repair Planet Material"
            );

            Material[] sources =
                renderer.sharedMaterials;

            if (sources == null ||
                sources.Length == 0)
            {
                sources =
                    new Material[]
                    {
                        fallback
                    };
            }

            Material[] repaired =
                new Material[
                    sources.Length
                ];

            for (int i = 0;
                 i < sources.Length;
                 i++)
            {
                Material source =
                    sources[i] != null
                        ? sources[i]
                        : fallback;

                Material mat;

                Texture texture =
                    GetBestTexture(
                        source
                    );

                Color color =
                    GetBestColor(
                        source
                    );

                if (source != null)
                {
                    mat =
                        new Material(
                            source
                        );
                }
                else
                {
                    mat =
                        new Material(
                            cartoon
                        );
                }

                string n =
                    renderer.name.ToLowerInvariant();

                string sourceShader =
                    source != null &&
                    source.shader != null
                        ? source.shader.name.ToLowerInvariant()
                        : "";

                mat.name =
                    "KS_PLANET_" +
                    renderer.name +
                    "_" +
                    i;

                if (n.Contains("shadow") ||
                    sourceShader.Contains("shadow"))
                {
                    if (shadow != null)
                        mat.shader =
                            shadow;
                }
                else if (
                    n.Contains("glass") ||
                    n.Contains("water") ||
                    n.Contains("sea") ||
                    sourceShader.Contains("transparent") ||
                    sourceShader.Contains("alpha") ||
                    sourceShader.Contains("additive"))
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
                    // Unsupported DianDian/TD shaderleri pink olmasin.
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

                repaired[i] =
                    mat;
            }

            renderer.sharedMaterials =
                repaired;

            renderer.enabled =
                true;

            EditorUtility.SetDirty(
                renderer
            );
        }
    }

    private static Texture GetBestTexture(
        Material mat)
    {
        if (mat == null)
            return null;

        string[] common =
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

        foreach (string p in common)
        {
            if (mat.HasProperty(p))
            {
                Texture t =
                    mat.GetTexture(p);

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

        if (mat.HasProperty("_TintColor"))
            return mat.GetColor(
                "_TintColor"
            );

        return Color.white;
    }

    private static void ApplyColor(
        Material mat,
        Color color)
    {
        if (mat == null)
            return;

        if (mat.HasProperty("_BaseColor"))
        {
            mat.SetColor(
                "_BaseColor",
                color
            );
        }

        if (mat.HasProperty("_Color"))
        {
            mat.SetColor(
                "_Color",
                color
            );
        }
    }


    // =====================================================
    // TEXTURE
    // =====================================================

    private static void ApplyTexture(
        Material mat,
        Texture texture)
    {
        if (mat == null ||
            texture == null)
            return;

        if (mat.HasProperty("_BaseMap"))
        {
            mat.SetTexture(
                "_BaseMap",
                texture
            );
        }

        if (mat.HasProperty("_MainTex"))
        {
            mat.SetTexture(
                "_MainTex",
                texture
            );
        }

        if (mat.HasProperty("_BaseTex"))
        {
            mat.SetTexture(
                "_BaseTex",
                texture
            );
        }
    }


    // =====================================================
    // PLANET FALLBACK MATERIAL
    // =====================================================

    private static Material FindPlanetDiffuseMaterial(
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

            Material found =
                AssetDatabase.LoadAssetAtPath<Material>(
                    path
                );

            if (found != null &&
                string.Equals(
                    found.name,
                    exactName,
                    StringComparison.OrdinalIgnoreCase))
            {
                return found;
            }
        }

        return null;
    }



    // =====================================================
    // FROZEN PLANET RUNTIME / EDITOR HELPERS
    // =====================================================

    private static void SetLayerRecursively(
        GameObject root,
        int layer)
    {
        Transform[] all =
            root.GetComponentsInChildren<Transform>(
                true
            );

        foreach (Transform t in all)
        {
            t.gameObject.layer =
                layer;
        }
    }

    private static void EvaluateAnimators(
        GameObject root)
    {
        Animator[] animators =
            root.GetComponentsInChildren<Animator>(
                true
            );

        foreach (Animator animator in animators)
        {
            if (animator == null)
                continue;

            try
            {
                animator.enabled = true;
                animator.Rebind();
                animator.Update(0f);

                EditorUtility.SetDirty(
                    animator
                );
            }
            catch (Exception e)
            {
                Debug.LogWarning(
                    "KINGSHOT: Animator evaluate olmadi: " +
                    animator.name +
                    " | " +
                    e.Message
                );
            }
        }
    }

    private static Texture2D FindTextureForMaterial(
        string materialName)
    {
        if (string.IsNullOrEmpty(
            materialName))
        {
            return null;
        }

        List<string> candidates =
            new List<string>();

        if (materialName.StartsWith(
            "m_",
            StringComparison.OrdinalIgnoreCase))
        {
            candidates.Add(
                "t_" +
                materialName.Substring(2)
            );
        }

        // LV5 normalcolor materialinin texture adi _ani-dir.
        candidates.Add(
            materialName.Replace(
                "_ani_normalcolor",
                "_ani"
            ).Replace(
                "m_",
                "t_"
            )
        );

        // Bazi materiallar "anim" deyil "building" texture-u istifade edir.
        candidates.Add(
            materialName.Replace(
                "m_skin_anim_",
                "t_skin_anim_"
            )
        );

        candidates.Add(
            materialName.Replace(
                "m_skin_building_",
                "t_skin_building_"
            )
        );

        foreach (string candidate in candidates)
        {
            if (string.IsNullOrEmpty(
                candidate))
            {
                continue;
            }

            string[] guids =
                AssetDatabase.FindAssets(
                    "\"" +
                    candidate +
                    "\" t:Texture2D"
                );

            foreach (string guid in guids)
            {
                string path =
                    AssetDatabase.GUIDToAssetPath(
                        guid
                    );

                Texture2D tex =
                    AssetDatabase.LoadAssetAtPath<Texture2D>(
                        path
                    );

                if (tex != null &&
                    string.Equals(
                        tex.name,
                        candidate,
                        StringComparison.OrdinalIgnoreCase))
                {
                    return tex;
                }
            }
        }

        return null;
    }


    // =====================================================
    // FIND MATERIAL
    // =====================================================

    private static Material FindMaterial(
        string baseName)
    {
        string direct =
            "Assets/" +
            baseName +
            ".mat";

        Material mat =
            AssetDatabase.LoadAssetAtPath<Material>(
                direct
            );

        if (mat != null)
            return mat;

        string[] guids =
            AssetDatabase.FindAssets(
                "\"" +
                baseName +
                "\" t:Material"
            );

        foreach (string guid in guids)
        {
            string path =
                AssetDatabase.GUIDToAssetPath(
                    guid
                );

            Material found =
                AssetDatabase.LoadAssetAtPath<Material>(
                    path
                );

            if (found != null &&
                string.Equals(
                    found.name,
                    baseName,
                    StringComparison.OrdinalIgnoreCase))
            {
                return found;
            }
        }

        Debug.LogWarning(
            "KINGSHOT: Material tapilmadi: " +
            baseName
        );

        return null;
    }


    // =====================================================
    // FIND TEXTURE
    // =====================================================

    private static Texture2D FindTexture(
        string baseName)
    {
        string direct =
            "Assets/" +
            baseName +
            ".png";

        Texture2D texture =
            AssetDatabase.LoadAssetAtPath<Texture2D>(
                direct
            );

        if (texture != null)
            return texture;

        string[] guids =
            AssetDatabase.FindAssets(
                "\"" +
                baseName +
                "\" t:Texture2D"
            );

        foreach (string guid in guids)
        {
            string path =
                AssetDatabase.GUIDToAssetPath(
                    guid
                );

            Texture2D found =
                AssetDatabase.LoadAssetAtPath<Texture2D>(
                    path
                );

            if (found != null &&
                string.Equals(
                    found.name,
                    baseName,
                    StringComparison.OrdinalIgnoreCase))
            {
                return found;
            }
        }

        Debug.LogWarning(
            "KINGSHOT: Texture tapilmadi: " +
            baseName
        );

        return null;
    }


    // =====================================================
    // FIND PREFAB
    // =====================================================

    private static GameObject FindPrefab(
        string exactName)
    {
        string direct =
            "Assets/" +
            exactName +
            ".prefab";

        GameObject prefab =
            AssetDatabase.LoadAssetAtPath<GameObject>(
                direct
            );

        if (prefab != null)
            return prefab;

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


    // =====================================================
    // FINISH
    // =====================================================

    private static void FinishVisual(
        GameObject visual,
        string message)
    {
        Selection.activeGameObject =
            visual;

        EditorGUIUtility.PingObject(
            visual
        );

        if (SceneView.lastActiveSceneView != null)
        {
            SceneView.lastActiveSceneView.FrameSelected();
        }

        EditorSceneManager.MarkSceneDirty(
            visual.scene
        );

        Debug.Log(
            message
        );
    }


    // =====================================================
    // REMOVE
    // =====================================================

    [MenuItem(
        "Tools/Kingshot/Furnace/Remove Level Visual"
    )]
    public static void RemoveCurrentVisual()
    {
        List<GameObject> toDelete =
            new List<GameObject>();

        GameObject furnaceRoot =
            GameObject.Find(
                FurnaceRootName
            );

        if (furnaceRoot != null)
        {
            Transform[] all =
                furnaceRoot.GetComponentsInChildren<Transform>(
                    true
                );

            foreach (Transform t in all)
            {
                if (t == null)
                    continue;

                if (t.gameObject == furnaceRoot)
                    continue;

                if (string.Equals(
                    t.name,
                    VisualRootName,
                    StringComparison.Ordinal))
                {
                    if (!toDelete.Contains(
                        t.gameObject))
                    {
                        toDelete.Add(
                            t.gameObject
                        );
                    }
                }
            }
        }

        // Evvelki test scriptlerinden qalan root-lari da temizle.
        GameObject[] sceneObjects =
            Resources.FindObjectsOfTypeAll<GameObject>();

        foreach (GameObject go in sceneObjects)
        {
            if (go == null)
                continue;

            if (!go.scene.IsValid() ||
                !go.scene.isLoaded)
            {
                continue;
            }

            bool oldPlanetRoot =
                string.Equals(
                    go.name,
                    "KINGSHOT_PLANET_SKIN_VISUAL",
                    StringComparison.Ordinal
                );

            bool duplicateVisual =
                string.Equals(
                    go.name,
                    VisualRootName,
                    StringComparison.Ordinal
                );

            if ((oldPlanetRoot ||
                 duplicateVisual) &&
                !toDelete.Contains(go))
            {
                toDelete.Add(go);
            }
        }

        foreach (GameObject go in toDelete)
        {
            Undo.DestroyObjectImmediate(
                go
            );
        }
    }
}
