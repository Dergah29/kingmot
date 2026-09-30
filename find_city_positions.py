import os
import re

ROOT = r"D:\asset\test4454\ExportedProject\Assets"
OUT = r"D:\asset\test4454\CITY_POSITION_CANDIDATES.txt"

wanted = [
    b"OffsetPosition",
    b"AngleY",
    b"ChildIds",
    b"GetBuildingPosition",
    b"EntityAttrs",
]

extensions = (
    ".bytes", ".txt", ".json", ".xml",
    ".asset", ".map", ".lua"
)

results = []

for root, dirs, files in os.walk(ROOT):
    for name in files:

        if not name.lower().endswith(extensions):
            continue

        path = os.path.join(root, name)

        try:
            data = open(path, "rb").read()
        except:
            continue

        hits = [x for x in wanted if x.lower() in data.lower()]

        # ən azı 2 placement əlaməti olmalıdır
        if len(hits) < 2:
            continue

        strings = re.findall(rb"[\x20-\x7E]{4,}", data)

        useful = []

        for s in strings:
            low = s.lower()

            if (
                b"position" in low
                or b"angley" in low
                or b"childids" in low
                or b"building" in low
                or b"entityattrs" in low
                or b"offset" in low
            ):
                useful.append(
                    s.decode("utf-8", errors="ignore")
                )

        results.append(
            "\n========================================\n"
            f"FILE: {path}\n"
            f"SIZE: {len(data)}\n"
            "HITS: " +
            ", ".join(x.decode() for x in hits) +
            "\n----------------------------------------\n" +
            "\n".join(useful[:150]) +
            "\n"
        )

with open(OUT, "w", encoding="utf-8") as f:
    f.write("".join(results))

print("DONE")
print("Candidates:", len(results))
print(OUT)