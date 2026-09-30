using UnityEngine;

public class KingshotOriginalUIBinderV18Runtime : MonoBehaviour
{
    public Camera targetCamera;
    public GameObject buildingWindow;

    void Start() {
        if (!targetCamera) targetCamera = Camera.main;
        if (buildingWindow) buildingWindow.SetActive(false);
    }

    void Update() {
        if (!targetCamera) targetCamera = Camera.main;
        if (!targetCamera || !buildingWindow || !Input.GetMouseButtonDown(0)) return;

        foreach (var hit in Physics.RaycastAll(targetCamera.ScreenPointToRay(Input.mousePosition), 2000f)) {
            Transform t = hit.transform;
            while (t) {
                if (t.parent && t.parent.name == "AUTO_CITY_BUILDINGS") {
                    buildingWindow.SetActive(true);
                    return;
                }
                t = t.parent;
            }
        }
    }
}