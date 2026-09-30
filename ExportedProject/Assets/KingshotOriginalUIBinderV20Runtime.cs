using UnityEngine;

public class KingshotOriginalUIBinderV20Runtime : MonoBehaviour
{
    public GameObject buildingWindow;

    void Start()
    {
        if (buildingWindow) buildingWindow.SetActive(false);
    }

    void Update()
    {
        if (!Input.GetMouseButtonDown(0) || !buildingWindow) return;

        // V14 already proves selection works. Use every active camera instead of Camera.main.
        Camera[] cams = Camera.allCameras;
        for (int c = 0; c < cams.Length; c++)
        {
            Camera cam = cams[c];
            if (!cam || !cam.enabled) continue;

            Ray ray = cam.ScreenPointToRay(Input.mousePosition);
            RaycastHit[] hits = Physics.RaycastAll(ray, 5000f);

            foreach (var hit in hits)
            {
                Transform t = hit.transform;
                while (t)
                {
                    if (t.parent && t.parent.name == "AUTO_CITY_BUILDINGS")
                    {
                        OpenWindow();
                        return;
                    }
                    t = t.parent;
                }
            }
        }
    }

    void OpenWindow()
    {
        buildingWindow.SetActive(true);

        // AssetRipper prefabs often export disabled children.
        foreach (Transform t in buildingWindow.GetComponentsInChildren<Transform>(true))
            t.gameObject.SetActive(true);

        Canvas[] canvases = buildingWindow.GetComponentsInChildren<Canvas>(true);
        foreach (Canvas c in canvases)
        {
            c.enabled = true;
            c.overrideSorting = true;
            c.sortingOrder = 30000;
        }

        RectTransform rt = buildingWindow.GetComponent<RectTransform>();
        if (rt)
        {
            rt.localScale = Vector3.one;
            rt.localPosition = Vector3.zero;
        }

        buildingWindow.transform.SetAsLastSibling();
        Debug.Log("KINGSHOT V20: Original BuildingInfoPanel OPENED");
    }
}
