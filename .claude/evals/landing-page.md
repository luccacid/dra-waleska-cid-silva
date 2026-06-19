# EVAL: landing-page (Dra. Waleska Cid Silva)

Release gate for the static landing page. Source of truth: `instruções.md §12 (Definition of Done)` + `§13 (Anti-IA checklist)`. Two grader tiers:

- **Code graders** — deterministic, runnable: `bash .claude/evals/grade.sh`. Fail = block.
- **Model graders** — the `landing-audit` workflow (5 reviewers + verify). Confirmed CRITICO/AVISO = block.

Target: code graders pass^1 = 100%; model grader = 0 confirmed CRITICO.

## Capability evals (DoD §12)

| # | Criterion | Grader | Type |
|---|---|---|---|
| 1 | Content traces to BRIEF; no fictional data | workflow `conteudo` | model |
| 2 | Signature element present (ECG "linha de cuidado") | `grep class="ecg"` | code |
| 3 | Palette = warm indigo + warm neutrals; no teal/cyan/terracota | `grade.sh` token scan | code |
| 4 | Typography Fraunces + Hanken, never Inter | `grade.sh` font scan | code |
| 5 | Orchestrated motion + reduced-motion fallback | `grep prefers-reduced-motion` | code |
| 6 | No generic card grid; sections vary | workflow `antiIA` | model |
| 7 | Responsive; visible keyboard focus; AA+ contrast | `grep @media`/`focus-visible` + workflow `auditor` | code+model |
| 8 | CFM: CRM visible, no superlatives/promises/antes-depois | `grade.sh` forbidden-words + workflow `compliance` | code+model |
| 9 | JSON-LD Physician + OG/Twitter metas complete | `grade.sh` | code |
| 10 | Build-less static (no deps/build step) | `grade.sh` (no package.json/node_modules) | code |
| 11 | lang="pt-BR" | `grep` | code |

## Forbidden (must NOT appear)

- CFM superlatives: `melhor`, `único`/`unico`, `número 1`/`numero 1`, `garantia de cura`, `antes e depois`
- Off-direction colors in CSS: `teal`, `cyan`, `terracota`
- `Inter` / `Roboto` as a font-family

## Run

```
bash .claude/evals/grade.sh        # code graders
# model graders: Workflow landing-audit (already wired)
```
