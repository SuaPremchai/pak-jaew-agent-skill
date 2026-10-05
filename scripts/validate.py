#!/usr/bin/env python3
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SKILL = ROOT / "skills" / "pak-jaew" / "SKILL.md"
PLUGIN = ROOT / "plugin.json"
CODEX_PLUGIN = ROOT / ".codex-plugin" / "plugin.json"

errors: list[str] = []

if not SKILL.is_file():
    errors.append("Missing skills/pak-jaew/SKILL.md")
else:
    text = SKILL.read_text(encoding="utf-8")
    match = re.match(r"^---\n(.*?)\n---\n", text, re.S)
    if not match:
        errors.append("SKILL.md must start with YAML frontmatter")
    else:
        fm = match.group(1)
        if not re.search(r"(?m)^name:\s*pak-jaew\s*$", fm):
            errors.append("SKILL.md frontmatter name must be pak-jaew")
        desc = re.search(r"(?m)^description:\s*(.+)$", fm)
        if not desc or len(desc.group(1).strip()) < 40:
            errors.append("SKILL.md description should explain purpose and trigger")

    required_phrases = [
        "work equivalence",
        "correctness wins",
        "tool selection",
        "Git operations",
        "deployment operations",
        "Criticize the mistake",
    ]
    lowered = text.lower()
    for phrase in required_phrases:
        if phrase.lower() not in lowered:
            errors.append(f"Missing non-interference/safety phrase: {phrase}")

for manifest in (PLUGIN, CODEX_PLUGIN):
    if not manifest.is_file():
        errors.append(f"Missing manifest: {manifest.relative_to(ROOT)}")
        continue
    try:
        data = json.loads(manifest.read_text(encoding="utf-8"))
    except Exception as exc:
        errors.append(f"Invalid JSON in {manifest.relative_to(ROOT)}: {exc}")
        continue
    if data.get("name") != "pak-jaew-agent-skill":
        errors.append(f"Unexpected plugin name in {manifest.relative_to(ROOT)}")
    if data.get("version") != "0.1.0":
        errors.append(f"Unexpected version in {manifest.relative_to(ROOT)}")

if errors:
    print("Validation failed:")
    for error in errors:
        print(f"- {error}")
    sys.exit(1)

print("Validation passed: Pak Jaew skill structure and invariants look correct.")
