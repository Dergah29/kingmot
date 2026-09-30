using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System.Collections.Generic;

public static class KingshotBuiltCityV3
{
    const string ROOT = "AUTO_CITY_BUILDINGS";

    // Uses the same confirmed APK-config slots/coordinates as the working rebuilder,
    // but chooses a constructed prefab instead of the *_00 empty/default model.
    struct B {
        public int id; public string model; public Vector3 p; public float y;
        public B(int id,string model,float x,float z,float y=0) {
            this.id=id; this.model=model; p=new Vector3(x,0,z); this.y=y;
        }
    }

    static readonly B[] buildings = {
        new B(341,"city_building_expert_academy_01",-52,-105.5f),
        new B(402,"city_building_td_gate_02b_00",0,-115),
        new B(401,"city_building_td_gate_01_00",0,-27),
        new B(339,"city_building_pet_home_01",-32,-96),
        new B(337,"city_building_firecrystal_wra_cademy_01",-17,-119.5f),
        new B(336,"city_building_firecrystal_alchemist_workshop_01",12.5f,-118),
        new B(335,"city_building_monument_01",0,-68),
        new B(332,"city_building_arena_01",11.5f,-100),
        new B(331,"city_building_command_01",-12.5f,-101.5f),
        new B(330,"city_building_conscription_office_01",-34.5f,-58.5f),
        new B(329,"city_building_lab_01",-13,-83),
        new B(328,"city_building_lighthouse_01",32,-40),
        new B(327,"city_building_warehouse_01",-30,-78.5f),
        new B(326,"city_building_arena_01",33.5f,-78.5f),
        new B(325,"city_building_embassy_01",31.5f,-96.5f),
        new B(324,"city_building_military_hospital_01",-15.5f,-56),
        new B(323,"city_building_archer_house_01",14,-80),
        new B(322,"city_building_pikeman_camp_01",35,-57),
        new B(321,"city_building_infantry_quarters_01",16.5f,-56),
        new B(319,"city_building_law_office_01",-29.5f,-41.5f),
        new B(318,"city_building_heroes_hall_01",14.5f,-36.5f),
        new B(315,"city_building_dorm_01",-25.5f,25,-45),
        new B(314,"city_building_dorm_01",-31.5f,15.5f,-60),
        new B(313,"city_building_dorm_01",-34.5f,3.5f,-88),
        new B(312,"city_building_dorm_01",-33.5f,-8.5f,-101),
        new B(311,"city_building_dorm_01",-15,13,-51.5f),
        new B(310,"city_building_dorm_01",-18.5f,0,-91),
        new B(309,"city_building_dorm_01",14.5f,12.5f,51),
        new B(308,"city_building_dorm_01",18.5f,1,86),
        new B(307,"city_building_hospital_01",-14,36,-22),
        new B(306,"city_building_kitchen_01",0,21.5f),
        new B(305,"city_building_hunter_cabin_01",10,36,17),
        new B(304,"city_building_ironworks_01",36,-9.5f,15),
        new B(303,"city_building_coalmine_01",37,8,-10),
        new B(302,"city_building_sawmill_01",27,27,42),
        new B(301,"city_building_furnace_01",0,0)
    };

    [MenuItem("Kingshot/City/V3/Rebuild Fully Built City")]
    public static void Build()
    {
        var old = GameObject.Find(ROOT);
        if (old != null) Undo.DestroyObjectImmediate(old);

        var root = new GameObject(ROOT);
        Undo.RegisterCreatedObjectUndo(root, "Build Kingshot city");

        int made=0; var missing=new List<string>();

        foreach(var b in buildings) {
            GameObject prefab=FindPrefab(b.model);
            if(prefab==null) { missing.Add(b.id+" : "+b.model); continue; }

            var go=PrefabUtility.InstantiatePrefab(prefab) as GameObject;
            if(go==null) { missing.Add(b.id+" : instantiate "+b.model); continue; }

            Undo.RegisterCreatedObjectUndo(go, "Build "+b.model);
            go.name=b.id+"_"+prefab.name;
            go.transform.SetParent(root.transform,false);
            go.transform.localPosition=b.p;
            go.transform.localRotation=Quaternion.Euler(0,b.y,0);
            go.transform.localScale=Vector3.one;
            made++;
        }

        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        Selection.activeGameObject=root;
        Debug.Log("[Kingshot V3] Fully built city: "+made+
                  " buildings. Missing="+missing.Count+
                  (missing.Count>0 ? "\n"+string.Join("\n",missing) : ""));
    }

    static GameObject FindPrefab(string model)
    {
        string[] g=AssetDatabase.FindAssets(model+" t:Prefab");
        GameObject fallback=null;
        foreach(string id in g) {
            string path=AssetDatabase.GUIDToAssetPath(id);
            var p=AssetDatabase.LoadAssetAtPath<GameObject>(path);
            if(p==null) continue;
            if(p.name==model) return p;
            if(fallback==null && p.name.StartsWith(model)) fallback=p;
        }
        return fallback;
    }
}
