import re
from pathlib import Path

FILES = [
    Path(r"D:\asset\test4454\ExportedProject\Assets\game_read_CityRead.bytes"),
    Path(r"D:\asset\test4454\ExportedProject\Assets\game_read_CityRead_0.bytes"),
]

OUT = Path(r"D:\asset\test4454\CITYREAD_ANALYSIS.txt")

TARGETS = [
    "GetBuildingPosition",
    "GetBuildingOffsetPosition",
    "GetSwitchBuildingPosition",
    "GetBuildModelName",
    "GetAllBuildConfig",
    "GetBuildConfig",
    "offset_position",
    "Position",
    "AngleY",
    "BuildingId",
    "BuildingID",
    "build_id",
    "config",
    "ModelName",
]

with OUT.open("w", encoding="utf-8") as out:
    for path in FILES:
        data = path.read_bytes()

        out.write("=" * 80 + "\n")
        out.write(f"FILE: {path}\n")
        out.write(f"SIZE: {len(data)} bytes\n")
        out.write("=" * 80 + "\n\n")

        # Extract readable ASCII strings with offsets
        strings = []
        for m in re.finditer(rb"[\x20-\x7e]{3,}", data):
            s = m.group().decode("ascii", errors="replace")
            strings.append((m.start(), s))

        out.write("=== TARGET MATCHES + NEARBY STRINGS ===\n\n")

        for target in TARGETS:
            matches = [
                i for i, (_, s) in enumerate(strings)
                if target.lower() in s.lower()
            ]

            if not matches:
                continue

            out.write(f"\n##### {target} #####\n")

            for idx in matches:
                start = max(0, idx - 25)
                end = min(len(strings), idx + 26)

                for j in range(start, end):
                    off, s = strings[j]
                    marker = ">>" if j == idx else "  "
                    out.write(f"{marker} 0x{off:08X}  {s}\n")

                out.write("\n" + "-" * 60 + "\n")

        out.write("\n\n=== ALL CITY/BUILD/POSITION RELATED STRINGS ===\n\n")

        words = (
            "city", "build", "position", "offset", "angle",
            "model", "config", "slot", "index", "coord",
            "transform", "localposition"
        )

        for off, s in strings:
            if any(w in s.lower() for w in words):
                out.write(f"0x{off:08X}  {s}\n")

print("DONE")
print("Report:", OUT)