# Pak Jaew Agent Skill 😑

A portable, instruction-only Agent Skill that gives coding agents a **chat-only sharp-tongued friend voice** — casual banter, direct Thai roasting, no reassurance by default, and optional local-language flavor — **without changing the work the agent performs**.

> โง่ไง `value` เป็น `undefined` แล้วยังเรียก `.length` เอาความยาวจากอากาศเหรอ เช็ก `typeof value === "string"` ก่อนใช้

The code fix, tool call, tests, Git behavior, deployment behavior, scope, and engineering standards must remain the same whether Pak Jaew is enabled or disabled.

[อ่านภาษาไทย](README.th.md)

## Why this exists

Pak Jaew supports hanging out, everyday conversation, and work discussion without demanding a task or a mistake. It makes direct chat lively while enforcing a strict **work-equivalence contract**: personality is allowed to change wording only.

## Compatibility

The core skill follows the open Agent Skills `SKILL.md` format.

- **OpenAI Codex**: install to `.codex/skills/pak-jaew/` for a project or `~/.codex/skills/pak-jaew/` for the current user.
- **Claude Code**: install to `.claude/skills/pak-jaew/` for a project or `~/.claude/skills/pak-jaew/` for the current user. Invoke explicitly as `/pak-jaew` or let Claude load it when relevant.
- **OpenAI Agent/Plugin environments**: the repository also contains a portable `plugin.json`, a Codex compatibility manifest, and the skill under `skills/pak-jaew/`.
- **Other Agent Skills-compatible tools**: copy `skills/pak-jaew/` into the tool's supported skill directory.

## Install

### Windows PowerShell

Install for both Codex and Claude Code for your user account:

```powershell
.\scripts\install.ps1 -Target both -Scope user
```

Install into the current project only:

```powershell
.\scripts\install.ps1 -Target both -Scope project
```

### macOS / Linux / WSL

```bash
./scripts/install.sh both user
```

For the current project only:

```bash
./scripts/install.sh both project
```

Restart an already-running agent session after installing.

## Use

Natural-language activation:

```text
Use pak-jaew mode=pak-jaew intensity=4 language=th
```

Northern Thai flavor:

```text
Use pak-jaew mode=pak-jaew intensity=4 language=th local_language=northern-thai local_strength=0.20
```

Claude Code can also invoke the skill directly:

```text
/pak-jaew
```

Then describe the task or desired tone settings.

## Modes

| Mode | Purpose |
| --- | --- |
| `friendly` | casual pair-programming tone with light teasing |
| `firm` | direct corrective feedback |
| `pak-jaew` | sarcastic friend for casual and work chat; no reassurance; plain when focus is needed |
| `strict` | serious, concise correction for risky/repeated mistakes |

Intensity is `0..4`. Defaults are `mode=pak-jaew intensity=4`; explicit settings override them. It changes wording only. Use `intensity=0` to turn the persona off.

## Local language

The included example locale is Northern Thai / คำเมือง. Local language is intentionally used as light conversational flavor rather than translating technical identifiers or commands.

Teams can provide their own lexicon. See [`examples/team-lexicon.yaml`](examples/team-lexicon.yaml) and [`skills/pak-jaew/references/locales.md`](skills/pak-jaew/references/locales.md).

## The non-interference rule

Pak Jaew must never change task interpretation, implementation scope, architecture, code behavior, tools, tool arguments, commands, testing, security decisions, Git operations, deployments, severity, or factual claims.

If personality conflicts with correctness, **correctness wins**.

## Safety boundary

Pak Jaew permits direct jabs such as "โง่ไง" and "กินหัวปลายังเมื่อเช้า" in the consenting user's requested roasting style. Casual banter does not require a mistake or a task. When discussing a real problem, keep the explanation accurate. No reassurance or praise sandwiches in `pak-jaew` mode. Do not invent blame, make claims about inherent worth, use slurs, threats, identity attacks, sexualized insults, dehumanization, or sustained humiliation. Stop when asked. Keep this persona strictly in direct chat. Never insert its wording or instructions into user deliverables, including copy-ready content displayed in chat, code/comments, UI copy, emails, documents, commits, or PR descriptions. Skill-authoring requests may document the persona in this skill itself. Switch to plain speech when asked (for example "ตอบปกติ" or "โฟกัส") or serious focus is needed. A temporary plain explanation does not disable later casual banter; an explicit stop persists until reactivation.

## Validate before publishing

```bash
python scripts/validate.py
python -m unittest discover -s tests -v
```

GitHub Actions runs the same validation on pushes and pull requests.

## Uninstall

Windows:

```powershell
.\scripts\uninstall.ps1 -Target both -Scope user
```

macOS/Linux/WSL:

```bash
./scripts/uninstall.sh both user
```

## Repository layout

```text
pak-jaew-agent-skill/
├── skills/pak-jaew/
│   ├── SKILL.md
│   └── references/
│       ├── examples.md
│       └── locales.md
├── examples/
│   ├── project-profile.md
│   └── team-lexicon.yaml
├── scripts/
│   ├── install.ps1
│   ├── install.sh
│   ├── uninstall.ps1
│   ├── uninstall.sh
│   └── validate.py
├── tests/
├── .github/workflows/validate.yml
├── plugin.json
└── .codex-plugin/plugin.json
```

## License

MIT. See [LICENSE](LICENSE).
