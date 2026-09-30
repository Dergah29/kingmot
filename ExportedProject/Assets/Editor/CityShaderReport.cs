using UnityEngine;
using UnityEditor;
using UnityEngine.SceneManagement;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Linq;

public static class CityShaderReport
{
    [MenuItem("Tools/Kingshot/City Shader Report")]
    public static void GenerateReport()
    {
        Scene scene = SceneManager.GetActiveScene();

        if (!scene.IsValid())
        {
            Debug.LogError("Active scene tapılmadı.");
            return;
        }

        Dictionary<string, ShaderInfo> shaders =
            new Dictionary<string, ShaderInfo>();

        Renderer[] renderers =
            Object.FindObjectsOfType<Renderer>(true);

        int rendererCount = 0;
        int materialSlots = 0;

        foreach (Renderer renderer in renderers)
        {
            if (renderer.gameObject.scene != scene)
                continue;

            rendererCount++;

            Material[] materials = renderer.sharedMaterials;

            foreach (Material mat in materials)
            {
                materialSlots++;

                if (mat == null)
                    continue;

                string shaderName =
                    mat.shader != null
                    ? mat.shader.name
                    : "<NULL SHADER>";

                if (!shaders.TryGetValue(shaderName, out ShaderInfo info))
                {
                    info = new ShaderInfo();
                    info.shaderName = shaderName;
                    shaders.Add(shaderName, info);
                }

                info.slotCount++;

                if (!info.materialNames.Contains(mat.name))
                    info.materialNames.Add(mat.name);

                if (!info.rendererNames.Contains(renderer.name))
                    info.rendererNames.Add(renderer.name);
            }
        }

        StringBuilder sb = new StringBuilder();

        sb.AppendLine("KINGSHOT CITY SHADER REPORT");
        sb.AppendLine("===========================");
        sb.AppendLine();
        sb.AppendLine("Scene: " + scene.name);
        sb.AppendLine("Renderers: " + rendererCount);
        sb.AppendLine("Material Slots: " + materialSlots);
        sb.AppendLine("Unique Shaders: " + shaders.Count);
        sb.AppendLine();

        var ordered = shaders.Values
            .OrderByDescending(x => x.slotCount)
            .ThenBy(x => x.shaderName);

        foreach (ShaderInfo info in ordered)
        {
            sb.AppendLine("-----------------------------------------");
            sb.AppendLine("SHADER: " + info.shaderName);
            sb.AppendLine("SLOTS: " + info.slotCount);
            sb.AppendLine("UNIQUE MATERIALS: " + info.materialNames.Count);
            sb.AppendLine();

            sb.AppendLine("MATERIALS:");

            foreach (string mat in info.materialNames.OrderBy(x => x))
                sb.AppendLine("  " + mat);

            sb.AppendLine();
            sb.AppendLine("RENDERERS:");

            foreach (string r in info.rendererNames.OrderBy(x => x))
                sb.AppendLine("  " + r);

            sb.AppendLine();
        }

        string path = @"D:\asset\CITY_SHADER_REPORT.txt";

        File.WriteAllText(path, sb.ToString(), Encoding.UTF8);

        Debug.Log(
            "KINGSHOT CITY SHADER REPORT READY\n" +
            "Shaders: " + shaders.Count +
            "\nRenderers: " + rendererCount +
            "\nMaterial Slots: " + materialSlots +
            "\nFile: " + path
        );

        EditorUtility.RevealInFinder(path);
    }

    private class ShaderInfo
    {
        public string shaderName;
        public int slotCount;

        public HashSet<string> materialNames =
            new HashSet<string>();

        public HashSet<string> rendererNames =
            new HashSet<string>();
    }
}