import os
import re

ROOT = r"D:\asset\test4454\ExportedProject\Assets"
OUT = r"D:\asset\test4454\CITY_CONFIG_SEARCH.txt"

keywords = [
    b"furnace",
    b"city_building",
    b"CityBuilding",
    b"building_id",
    b"buildingId",
    b"position",
    b"Position",
    b"innercity",
]

results = []

for root, dirs, files in os.walk(ROOT):
    for name in files:
        if not name.lower().endswith((".bytes", ".txt", ".json", ".xml", ".map")):
            continue

        path = os.path.join(root, name)

        try:
            with open(path, "rb") as f:
                data = f.read()

            low = data.lower()

            found = []
            for k in keywords:
                if k.lower() in low:
                    found.append(k.decode("ascii", errors="ignore"))

            if not found:
                continue

            strings = re.findall(rb"[\x20-\x7E]{4,}", data)

            results.append(
                "\n==================================================\n"
                f"FILE: {path}\n"
                f"SIZE: {len(data)}\n"
                f"MATCH: {', '.join(found)}\n"
                "--------------------------------------------------\n"
                + "\n".join(
                    x.decode("utf-8", errors="ignore")
                    for x in strings[:300]
                )
                + "\n"
            )

        except Exception as e:
            pass

with open(OUT, "w", encoding="utf-8") as f:
    f.write("".join(results))

print("DONE")
print("Matched files:", len(results))
print("Report:", OUT)