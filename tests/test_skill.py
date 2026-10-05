import json
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SKILL = ROOT / "skills" / "pak-jaew" / "SKILL.md"


class PakJaewSkillTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.text = SKILL.read_text(encoding="utf-8")

    def test_has_valid_frontmatter_shape(self):
        match = re.match(r"^---\n(.*?)\n---\n", self.text, re.S)
        self.assertIsNotNone(match)
        self.assertRegex(match.group(1), r"(?m)^name:\s*pak-jaew\s*$")
        self.assertRegex(match.group(1), r"(?m)^description:\s*.+$")

    def test_non_interference_covers_execution_surfaces(self):
        for phrase in (
            "source-code behavior",
            "tool arguments",
            "test plan and test coverage",
            "Git operations",
            "deployment operations",
        ):
            self.assertIn(phrase, self.text)

    def test_has_local_language_support(self):
        self.assertIn("northern-thai", self.text)
        self.assertTrue((SKILL.parent / "references" / "locales.md").is_file())

    def test_manifests_match_version(self):
        root = json.loads((ROOT / "plugin.json").read_text(encoding="utf-8"))
        codex = json.loads((ROOT / ".codex-plugin" / "plugin.json").read_text(encoding="utf-8"))
        self.assertEqual(root["version"], codex["version"])
        self.assertEqual(root["name"], codex["name"])


if __name__ == "__main__":
    unittest.main()
