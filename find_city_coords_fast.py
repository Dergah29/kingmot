from pathlib import Path

ROOT = Path(r"D:\asset\test4454\ExportedProject\Assets")
OUT = Path(r"D:\asset\test4454\COORD_FILES_UNIQUE.txt")

EXTENSIONS = {
    ".bytes",
    ".txt",
    ".json",
    ".xml",
    ".map",
    ".csv",
    ".lua",
    ".cs",
}

TERMS = [
    b"coordinates",
    b"coordinates2",
    b"td_coordinates",
    b"offset_position",
    b"host_coordinates",
    b"GetBuildingPosition",
    b"GetAllBuildConfig",
]

results = []
checked = 0

print("Searching...")

for p in ROOT.rglob("*"):

    if not p.is_file():
        continue

    if p.suffix.lower() not in EXTENSIONS:
        continue

    checked += 1

    try:
        data = p.read_bytes().lower()
    except Exception:
        continue

    found = []

    for term in TERMS:
        if term.lower() in data:
            found.append(term.decode("ascii"))

    if found:
        results.append((p, found))
        print("FOUND:", p.name)

with OUT.open("w", encoding="utf-8") as f:

    f.write("KINGSHOT CITY COORDINATE SEARCH\n")
    f.write("=" * 70 + "\n\n")

    f.write(f"FILES CHECKED: {checked}\n")
    f.write(f"MATCHED FILES: {len(results)}\n\n")

    for path, found in results:
        f.write("FILE:\n")
        f.write(str(path) + "\n")

        f.write("MATCH:\n")
        for x in found:
            f.write("  - " + x + "\n")

        f.write("\n" + "-" * 70 + "\n\n")

print()
print("DONE")
print("Files checked:", checked)
print("Matched files:", len(results))
print("Report:", OUT)