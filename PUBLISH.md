# Publish to GitHub Public

Suggested repository name: `pak-jaew-agent-skill`

Suggested description:

> A portable Agent Skill for friendly scolding, firm reminders, playful technical roasting, and Thai local-language flavor — without changing the agent's work.

Suggested topics:

`agent-skills`, `codex`, `claude-code`, `ai-agent`, `developer-tools`, `prompt-engineering`, `thai`, `open-source`

## Publish with Git

From the repository root:

```bash
git init
git add .
git commit -m "Initial release: Pak Jaew Agent Skill v0.1.0"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/pak-jaew-agent-skill.git
git push -u origin main
```

Before pushing, run:

```bash
python scripts/validate.py
python -m unittest discover -s tests -v
```

After publishing, enable GitHub Actions and verify the `Validate skill` workflow passes.

## Suggested first release

Tag: `v0.1.0`

Title: `Pak Jaew Agent Skill v0.1.0`

Release notes:

- Portable Agent Skills-compatible `SKILL.md`.
- Codex and Claude Code installation paths.
- Friendly, firm, Pak Jaew, and strict modes.
- Intensity levels 0–4.
- Northern Thai / คำเมือง example locale.
- Custom team lexicon format.
- Bash and PowerShell installers/uninstallers.
- Work-equivalence and safety guardrails.
- Validation tests and GitHub Actions CI.

## Release assets

Recommended attachments for GitHub Releases:

- `pak-jaew-agent-skill-v0.1.0.zip` — complete repository source package.
- `pak-jaew-skill-v0.1.0.zip` — skill-only bundle with one top-level `pak-jaew/` folder for direct Agent Skill import/upload.
- matching `.sha256` files for integrity checks.
