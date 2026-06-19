#!/usr/bin/env bash
# Code graders for the WCS landing page. Deterministic DoD checks (instruções §12/§13).
# Run from project root: bash .claude/evals/grade.sh
# ponytail: grep-based asserts, the smallest thing that fails if the page regresses.
set -u
cd "$(dirname "$0")/../.." || exit 2
H=index.html; C=css/styles.css
fail=0
ok(){ printf '  PASS  %s\n' "$1"; }
no(){ printf '  FAIL  %s\n' "$1"; fail=1; }

# present = grep must match; absent = grep must NOT match
present(){ grep -qiE "$2" "$3" && ok "$1" || no "$1"; }
absent(){ grep -qiE "$2" "$3" && no "$1" || ok "$1"; }

echo "== Landing page code graders =="
present "2  ECG signature present"        'class="ecg' "$H"
present "4  Fraunces display font"         'Fraunces'   "$C"
present "4  Hanken body font"              'Hanken'     "$C"
present "5  reduced-motion fallback"       'prefers-reduced-motion' "$C"
present "7  visible keyboard focus"        'focus-visible' "$C"
present "7  responsive @media"             '@media'     "$C"
present "8  CRM visible"                   'CRM 6410'   "$H"
present "9  JSON-LD Physician"             '"@type": *"Physician"' "$H"
present "9  OG title meta"                 'og:title'   "$H"
present "9  Twitter card meta"             'twitter:card' "$H"
present "11 lang pt-BR"                    'lang="pt-BR"' "$H"

# Forbidden — CFM superlatives / promises (whole-word where it matters)
absent  "8  no 'melhor'"                   '\bmelhor\b' "$H"
absent  "8  no 'número 1'"                 'n[uú]mero 1' "$H"
absent  "8  no 'antes e depois'"           'antes e depois' "$H"
absent  "8  no cure guarantee"             'garantia de cura|cura garantida' "$H"
# Off-direction palette in CSS
absent  "3  no teal/cyan/terracota"        'teal|cyan|terracota' "$C"
# Wrong fonts
absent  "4  no Inter/Roboto font"          'font-family[^;]*\b(Inter|Roboto)\b' "$C"

# Build-less static
[ -f package.json ] && no "10 build-less (package.json present)" || ok "10 build-less (no package.json)"

echo
[ "$fail" = 0 ] && echo "RESULT: PASS (code graders)" || echo "RESULT: FAIL (code graders)"
exit "$fail"
