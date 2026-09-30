using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using System.Collections.Generic;

public static class KingshotPlayableCityV14
{
    const string AUTO = "AUTO_CITY_BUILDINGS";

    [MenuItem("Kingshot/City/V14/Make City Playable")]
    public static void MakePlayable()
    {
        var root = GameObject.Find(AUTO);
        if (!root) {
            EditorUtility.DisplayDialog("Kingshot V14",
                "AUTO_CITY_BUILDINGS tapilmadi.\nEvvel V3 -> Rebuild Fully Built City bas.","OK");
            return;
        }

        Undo.RegisterFullObjectHierarchyUndo(root, "Make Kingshot City Playable");

        // Keep all rebuilt buildings active and clickable.
        int buildings = 0, colliders = 0;
        foreach (Transform b in root.transform)
        {
            b.gameObject.SetActive(true);
            buildings++;

            // One collider per building root, sized from visible renderers.
            var old = b.GetComponent<BoxCollider>();
            if (!old)
            {
                Bounds? bounds = GetVisibleBounds(b);
                if (bounds.HasValue)
                {
                    var bc = Undo.AddComponent<BoxCollider>(b.gameObject);
                    Bounds wb = bounds.Value;
                    bc.center = b.InverseTransformPoint(wb.center);

                    Vector3 lossy = b.lossyScale;
                    bc.size = new Vector3(
                        SafeDiv(wb.size.x, Mathf.Abs(lossy.x)),
                        SafeDiv(wb.size.y, Mathf.Abs(lossy.y)),
                        SafeDiv(wb.size.z, Mathf.Abs(lossy.z)));
                    colliders++;
                }
            }
        }

        // Create runtime controller.
        GameObject sys = GameObject.Find("KINGSHOT_PLAYABLE_SYSTEM");
        if (!sys) {
            sys = new GameObject("KINGSHOT_PLAYABLE_SYSTEM");
            Undo.RegisterCreatedObjectUndo(sys, "Create Kingshot Playable System");
        }

        var controller = sys.GetComponent<KingshotPlayableController>();
        if (!controller) controller = Undo.AddComponent<KingshotPlayableController>(sys);

        // Prefer the original city camera.
        Camera cam = null;
        var camGo = GameObject.Find("SceneRoot/MapRoot/CameraRoot/CameraZoom/Camera");
        if (camGo) cam = camGo.GetComponent<Camera>();
        if (!cam) cam = Camera.main;
        if (!cam) cam = Object.FindObjectOfType<Camera>(true);

        controller.targetCamera = cam;
        controller.buildingRoot = root.transform;

        if (cam) {
            cam.gameObject.SetActive(true);
            cam.enabled = true;
        }

        EditorUtility.SetDirty(sys);
        EditorUtility.SetDirty(root);
        EditorSceneManager.MarkSceneDirty(EditorSceneManager.GetActiveScene());
        Selection.activeGameObject = sys;

        EditorUtility.DisplayDialog("Kingshot V14",
            "Hazirdir.\nBuildings: "+buildings+
            "\nYeni collider: "+colliders+
            "\n\nPLAY bas.\nWASD / oxlar = kamera\nMouse wheel = zoom\nBinaya klik = secim","OK");
    }

    static float SafeDiv(float a, float b) { return b > 0.0001f ? a/b : a; }

    static Bounds? GetVisibleBounds(Transform root)
    {
        Renderer[] rs = root.GetComponentsInChildren<Renderer>(true);
        bool found = false;
        Bounds b = new Bounds();

        foreach (var r in rs)
        {
            if (!r.enabled || !r.gameObject.activeInHierarchy) continue;
            string n = r.name.ToLowerInvariant();
            if (n.Contains("shadow") || n.Contains("_low") || n.Contains("line")) continue;

            if (!found) { b = r.bounds; found = true; }
            else b.Encapsulate(r.bounds);
        }
        return found ? b : (Bounds?)null;
    }
}

public class KingshotPlayableController : MonoBehaviour
{
    public Camera targetCamera;
    public Transform buildingRoot;

    public float moveSpeed = 25f;
    public float zoomSpeed = 35f;
    public float minCameraSize = 8f;
    public float maxCameraSize = 65f;

    string selected = "";
    Vector3 dragStart;
    bool dragging;

    void Start()
    {
        if (!targetCamera) targetCamera = Camera.main;
    }

    void Update()
    {
        if (!targetCamera) return;

        float h = Input.GetAxisRaw("Horizontal");
        float v = Input.GetAxisRaw("Vertical");
        Vector3 right = Vector3.ProjectOnPlane(targetCamera.transform.right, Vector3.up).normalized;
        Vector3 forward = Vector3.ProjectOnPlane(targetCamera.transform.forward, Vector3.up).normalized;
        targetCamera.transform.position += (right*h + forward*v) * moveSpeed * Time.deltaTime;

        float wheel = Input.mouseScrollDelta.y;
        if (Mathf.Abs(wheel) > 0.001f)
        {
            if (targetCamera.orthographic)
                targetCamera.orthographicSize = Mathf.Clamp(
                    targetCamera.orthographicSize - wheel * zoomSpeed * .15f,
                    minCameraSize, maxCameraSize);
            else
                targetCamera.transform.position += targetCamera.transform.forward * wheel * zoomSpeed * .2f;
        }

        if (Input.GetMouseButtonDown(1)) {
            dragging = true;
            dragStart = Input.mousePosition;
        }
        if (Input.GetMouseButtonUp(1)) dragging = false;

        if (dragging) {
            Vector3 d = Input.mousePosition - dragStart;
            dragStart = Input.mousePosition;
            targetCamera.transform.position += (-right*d.x - forward*d.y) * .035f;
        }

        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = targetCamera.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(ray, out RaycastHit hit, 1000f))
            {
                Transform t = hit.transform;
                while (t.parent && t.parent != buildingRoot) t = t.parent;
                if (buildingRoot && t.parent == buildingRoot) selected = t.name;
            }
        }
    }

    void OnGUI()
    {
        GUI.Box(new Rect(15,15,285,82), "Kingshot Local City");
        GUI.Label(new Rect(28,42,260,22), "WASD / oxlar: hereket | Wheel: zoom");
        GUI.Label(new Rect(28,62,260,22),
            string.IsNullOrEmpty(selected) ? "Bina secilmeyib" : "Secildi: " + selected);
    }
}
