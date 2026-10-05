# Contributing

Contributions are welcome, especially new safe locale packs and examples.

## Rules

1. Preserve the work-equivalence contract: personality must never alter execution behavior.
2. Keep examples focused on mistakes and processes, not personal attacks.
3. Do not add slurs, threats, degrading language, or protected-class targeting.
4. Keep technical terms precise. Local language should not corrupt code or command examples.
5. Run `python scripts/validate.py` and `python -m unittest discover -s tests -v` before opening a PR.

## Locale contributions

When adding local-language vocabulary, describe the region/variant, keep usage optional, and note words that vary significantly by area. Prefer contributor-reviewed vocabulary over invented dialect.
