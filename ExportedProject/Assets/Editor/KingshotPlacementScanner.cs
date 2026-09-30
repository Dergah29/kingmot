using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using System;
using System.IO;
using System.Text;
using System.Reflection;
using System.Collections.Generic;

public static class KingshotPlacementScanner
{
    [MenuItem("Tools/Kingshot/Scan Original City Placement")]
    public static void Scan()
    {
        Scene scene = SceneManager.GetActiveScene();

        StringBuilder report = new StringBuilder();

        report.AppendLine("KINGSHOT ORIGINAL CITY PLACEMENT SCAN");
        report.AppendLine("====================================");
        report.AppendLine("Scene: " + scene.name);
        report.AppendLine();

        int sceneComponents = 0;
        int sceneMatches = 0;
        int assetMatches = 0;

        // =====================================================
        // 1. CURRENT CITY SCENE
        // =====================================================

        report.AppendLine("=== CURRENT SCENE COMPONENTS ===");
        report.AppendLine();

        foreach (GameObject root in scene.GetRootGameObjects())
        {
            Component[] components =
                root.GetComponentsInChildren<Component>(true);

            foreach (Component component in components)
            {
                if (component == null)
                    continue;

                sceneComponents++;

                Type type = component.GetType();

                string typeName = type.FullName ?? type.Name;
                string objectName = component.gameObject.name;

                string combined =
                    (typeName + " " + objectName).ToLowerInvariant();

                if (!LooksRelevant(combined))
                    continue;

                sceneMatches++;

                report.AppendLine(
                    "[SCENE] " +
                    GetHierarchyPath(component.gameObject)
                );

                report.AppendLine(
                    "Component: " + typeName
                );

                report.AppendLine(
                    "Transform: " +
                    FormatTransform(component.transform)
                );

                DumpSerializedObject(component, report);

                report.AppendLine();
            }
        }

        // =====================================================
        // 2. MONOBEHAVIOUR ASSETS
        // =====================================================

        report.AppendLine();
        report.AppendLine("=== RELEVANT MONOBEHAVIOUR ASSETS ===");
        report.AppendLine();

        string[] monoGuids =
            AssetDatabase.FindAssets("t:MonoBehaviour");

        foreach (string guid in monoGuids)
        {
            string path =
                AssetDatabase.GUIDToAssetPath(guid);

            UnityEngine.Object obj =
                AssetDatabase.LoadMainAssetAtPath(path);

            if (obj == null)
                continue;

            string combined =
                (obj.name + " " + path).ToLowerInvariant();

            if (!LooksRelevant(combined))
                continue;

            assetMatches++;

            report.AppendLine("[ASSET]");
            report.AppendLine("Name: " + obj.name);
            report.AppendLine("Path: " + path);

            DumpSerializedObject(obj, report);

            report.AppendLine();
        }

        // =====================================================
        // 3. TEXT ASSETS / CONFIGS
        // =====================================================

        report.AppendLine();
        report.AppendLine("=== RELEVANT TEXT ASSETS ===");
        report.AppendLine();

        string[] textGuids =
            AssetDatabase.FindAssets("t:TextAsset");

        int textMatches = 0;

        foreach (string guid in textGuids)
        {
            string path =
                AssetDatabase.GUIDToAssetPath(guid);

            TextAsset textAsset =
                AssetDatabase.LoadAssetAtPath<TextAsset>(path);

            if (textAsset == null)
                continue;

            string combined =
                (textAsset.name + " " + path).ToLowerInvariant();

            if (!LooksRelevant(combined))
                continue;

            textMatches++;

            report.AppendLine("[TEXT ASSET]");
            report.AppendLine("Name: " + textAsset.name);
            report.AppendLine("Path: " + path);
            report.AppendLine(
                "Size: " +
                textAsset.bytes.Length +
                " bytes"
            );

            // Mətn formasındadırsa ilk hissəni reporta sal.
            try
            {
                string text = textAsset.text;

                if (!string.IsNullOrEmpty(text))
                {
                    int length =
                        Mathf.Min(text.Length, 3000);

                    report.AppendLine("--- Preview ---");
                    report.AppendLine(
                        text.Substring(0, length)
                    );
                }
            }
            catch
            {
                report.AppendLine(
                    "(Binary / non-text asset)"
                );
            }

            report.AppendLine();
        }

        // =====================================================
        // SUMMARY
        // =====================================================

        report.AppendLine();
        report.AppendLine("=== SUMMARY ===");
        report.AppendLine(
            "Scene components scanned: " +
            sceneComponents
        );

        report.AppendLine(
            "Relevant scene components: " +
            sceneMatches
        );

        report.AppendLine(
            "Relevant MonoBehaviour assets: " +
            assetMatches
        );

        report.AppendLine(
            "Relevant TextAssets: " +
            textMatches
        );

        string outputPath =
            @"D:\asset\test4454\CITY_PLACEMENT_SCAN.txt";

        File.WriteAllText(
            outputPath,
            report.ToString(),
            Encoding.UTF8
        );

        Debug.Log(
            "KINGSHOT PLACEMENT SCAN COMPLETE\n" +
            "Scene matches: " + sceneMatches + "\n" +
            "MonoBehaviour matches: " + assetMatches + "\n" +
            "TextAsset matches: " + textMatches + "\n\n" +
            "Report:\n" + outputPath
        );

        EditorUtility.RevealInFinder(outputPath);
    }

    private static bool LooksRelevant(string value)
    {
        if (string.IsNullOrEmpty(value))
            return false;

        string[] keywords =
        {
            "building",
            "citybuilding",
            "city_building",
            "placement",
            "position",
            "coordinate",
            "layout",
            "map",
            "furnace",
            "castle",
            "house",
            "hospital",
            "embassy",
            "barrack",
            "stable",
            "academy",
            "warehouse"
        };

        foreach (string keyword in keywords)
        {
            if (value.Contains(keyword))
                return true;
        }

        return false;
    }

    private static string GetHierarchyPath(
        GameObject gameObject)
    {
        string path = gameObject.name;
        Transform current = gameObject.transform.parent;

        while (current != null)
        {
            path =
                current.name + "/" + path;

            current = current.parent;
        }

        return path;
    }

    private static string FormatTransform(
        Transform transform)
    {
        Vector3 p = transform.position;
        Vector3 r = transform.eulerAngles;
        Vector3 s = transform.lossyScale;

        return
            "Position(" +
            p.x.ToString("F3") + ", " +
            p.y.ToString("F3") + ", " +
            p.z.ToString("F3") + ") " +

            "Rotation(" +
            r.x.ToString("F3") + ", " +
            r.y.ToString("F3") + ", " +
            r.z.ToString("F3") + ") " +

            "Scale(" +
            s.x.ToString("F3") + ", " +
            s.y.ToString("F3") + ", " +
            s.z.ToString("F3") + ")";
    }

    private static void DumpSerializedObject(
        UnityEngine.Object obj,
        StringBuilder report)
    {
        try
        {
            SerializedObject serialized =
                new SerializedObject(obj);

            SerializedProperty property =
                serialized.GetIterator();

            bool enterChildren = true;
            int written = 0;

            while (property.NextVisible(enterChildren))
            {
                enterChildren = false;

                if (written >= 100)
                {
                    report.AppendLine(
                        "... property limit reached ..."
                    );
                    break;
                }

                string name =
                    property.propertyPath;

                string lower =
                    name.ToLowerInvariant();

                if (!LooksRelevant(lower) &&
                    property.propertyType !=
                    SerializedPropertyType.Vector2 &&
                    property.propertyType !=
                    SerializedPropertyType.Vector3 &&
                    property.propertyType !=
                    SerializedPropertyType.Integer &&
                    property.propertyType !=
                    SerializedPropertyType.String)
                {
                    continue;
                }

                report.Append("  ");
                report.Append(name);
                report.Append(" = ");

                switch (property.propertyType)
                {
                    case SerializedPropertyType.Integer:
                        report.Append(property.intValue);
                        break;

                    case SerializedPropertyType.Float:
                        report.Append(property.floatValue);
                        break;

                    case SerializedPropertyType.Boolean:
                        report.Append(property.boolValue);
                        break;

                    case SerializedPropertyType.String:
                        report.Append(property.stringValue);
                        break;

                    case SerializedPropertyType.Vector2:
                        report.Append(property.vector2Value);
                        break;

                    case SerializedPropertyType.Vector3:
                        report.Append(property.vector3Value);
                        break;

                    case SerializedPropertyType.Enum:
                        report.Append(property.enumValueIndex);
                        break;

                    case SerializedPropertyType.ObjectReference:
                        report.Append(
                            property.objectReferenceValue != null
                                ? property.objectReferenceValue.name
                                : "NULL"
                        );
                        break;

                    default:
                        report.Append(
                            "[" +
                            property.propertyType +
                            "]"
                        );
                        break;
                }

                report.AppendLine();
                written++;
            }
        }
        catch (Exception e)
        {
            report.AppendLine(
                "  SERIALIZATION ERROR: " +
                e.Message
            );
        }
    }
}