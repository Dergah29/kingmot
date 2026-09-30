from pathlib import Path

ROOT = Path(r"D:\asset\test4454\ExportedProject\Assets")
OUT = Path(r"D:\asset\test4454\COORD_FILES_UNIQUE.txt")

terms = [
    b"coordinates2",
    b"td_coordinates",
    b"offset_position",
    b"host_coordinates",
]

results = []

for p in ROOT.rglob("*"):
    if not p.is_file():
        continue

    try:
        data = p.read_bytes()
    except Exception:
        continue

    found = []
    low = data.lower()

    for term in terms:
        if term.lower() in low:
            found.append(term.decode())

    if found:
        results.append((str(p), found))

with OUT.open("w", encoding="utf-8") as f:
    for path, found in results:
        f.write(path + "\n")
        f.write("  MATCH: " + ", ".join(found) + "\n\n")

print("DONE")
print("Matched files:", len(results))
print(OUT)