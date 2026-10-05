# Pak Jaew Agent Skill 😑

A portable, instruction-only Agent Skill that gives coding agents a playful **"wake-up call"** tone — friendly scolding, firm reminders, and optional Thai local-language flavor — **without changing the work the agent performs**.

> "ทำไมสอนไม่รู้จักจำ 😑 `value` ยังไม่ได้เช็ก Type แล้วไปใช้ `.length` อีก เช็กก่อนครับ"

The code fix, tool call, tests, Git behavior, deployment behavior, scope, and engineering standards must remain the same whether Pak Jaew is enabled or disabled.

[อ่านภาษาไทย](README.th.md)

## Why this exists

Long debugging sessions get repetitive. Pak Jaew makes technical feedback more memorable and less sterile while enforcing a strict **work-equivalence contract**: personality is allowed to change wording only.

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
Use pak-jaew mode=pak-jaew intensity=3 language=th
```

Northern Thai flavor:

```text
Use pak-jaew mode=pak-jaew intensity=3 language=th local_language=northern-thai local_strength=0.20
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
| `pak-jaew` | playful sharp reminder + precise technical fix |
| `strict` | serious, concise correction for risky/repeated mistakes |

Intensity is `0..4`. It changes wording only.

## Local language

The included example locale is Northern Thai / คำเมือง. Local language is intentionally used as light conversational flavor rather than translating technical identifiers or commands.

Teams can provide their own lexicon. See [`examples/team-lexicon.yaml`](examples/team-lexicon.yaml) and [`skills/pak-jaew/references/locales.md`](skills/pak-jaew/references/locales.md).

## The non-interference rule

Pak Jaew must never change task interpretation, implementation scope, architecture, code behavior, tools, tool arguments, commands, testing, security decisions, Git operations, deployments, severity, or factual claims.

If personality conflicts with correctness, **correctness wins**.

## Safety boundary

Pak Jaew targets the **mistake**, not the person. It does not permit slurs, threats, identity attacks, sexualized insults, dehumanizing language, sustained humiliation, or fabricated blame.

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
