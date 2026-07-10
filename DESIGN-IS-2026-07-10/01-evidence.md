# Evidência consolidada — 4 subagents (estrutural, visual, copy, peso)

Sem instância rodando: evidência visual INFERIDA do fonte + screenshots `.claude/evals/shot-*.png`.

## E1 — Estrutural

- **7 elementos interativos** no total, todos `<a>`: skip-link (index.html:56), brand (59), "Marcar consulta" (65), "Falar pelo WhatsApp" (84), "Como eu atendo" (87), WhatsApp contato (197), e-mail (198). Zero decoys.
- **Profundidade DOM máx: 5** a partir de `<body>` (index.html:55→71→83→84).
- **Padrão repetido único:** CTA WhatsApp ×3 (header sticky :65, hero :84, contato :197), mesmo href `wa.me/5527997910392`.
- **Código morto: zero** — nenhum seletor CSS órfão, nenhum JS não usado; `aria-hidden`/`focusable="false"` em SVGs são necessários, não ruído.
- **10 seções**, cada uma com propósito único; 1 é divisor puramente decorativo (ECG, index.html:131, css:172).

## E2 — Visual (INFERRED)

- **Tipo:** escala fluida de 6 steps (`--step--1`..`--step-4`, css:20–25), aplicada consistentemente; **1 órfão**: `.brand__name` 1.05rem fixo (css:82).
- **Cor:** 8 tokens (css:3–10), **zero hex solto**, 12 derivações via `color-mix` — sistema 100% tokenizado.
- **Espaçamento:** macro em 4 clamps sistemáticos (css:18, 109, 143…); micro ad-hoc (~15 valores fixos rem/em, ex.: css:120–121, 152, 206).
- **Contraste texto:** todos os pares de texto AA+ — ink/paper 13.6:1, paper/azul-700 8.8:1, azul-500/paper 5.9:1. **Falhas só em decoração:** brasa/paper 2.21:1 (bullets `.mode__t::before` css:168, `.areas__list li::before` css:192), azul-300/azul-700 3.96:1 (divisor css:172) — sem carga semântica.
- **Estados:** `:focus-visible` ✓ (css:62–68, adaptado em faixas escuras), `:hover` ✓ (css:90, 101, 103, 230), `prefers-reduced-motion` ✓ (css:267–272); **`:active` ausente**; `:visited`/`disabled`/empty/loading/error N/A (estática, sem form).
- **A11y:** skip-link ✓ (index.html:56), 9 landmarks (header/main/footer + 6 sections com aria-label/labelledby), SVGs decorativos com aria-hidden ✓. Sem dark mode (nenhum `prefers-color-scheme`).

## E3 — Copy & honestidade

- **Inflações: nenhuma.** Sem superlativos, promessas, antes-e-depois (grep verificado).
- **Dark patterns: nenhum.** Sem urgência, escassez, confirmshaming.
- **Rótulo→comportamento: 100% consistente** — todos os 5 CTAs verificados contra href real.
- **Jargão para leigo 45+: 10 termos** sem tradução — "atenção primária" (index.html:152, 172), "doenças crônicas" (147), "agudas" (173), "intercorrências" (142, 154), "pré-operatória" (153), "laudos/pareceres" (156), "cardiovascular" (150), "coordenação do cuidado" (155), "medicina preventiva" (146), "encaixes" (154). Substitutos simples propostos no relatório do subagent.
- **CFM:** nome + CRM-ES 6410 consistentes em hero (index.html:73), footer (204) e JSON-LD (46). Disclaimer presente (205). **RQE ausente** (pendência BRIEF:9; comentários index.html:34, 72) — exigido ao anunciar especialidade MFC, que a página anuncia (73, 204, JSON-LD:41).
- Pendências não-bloqueantes: foto, endereço, horários (BRIEF), og-image raster placeholder.

## E4 — Peso & fricção

- **JS inicial: 1.183 bytes** (main.js 1.106 + inline 77). CSS+HTML: 24.280 bytes em disco (~60–70% menor com gzip).
- **11 requests** na view primária: 4 locais + manifest Google Fonts + ~6 woff2 (index.html:27–32, 208).
- **TTI ~700 ms ESTIMATED** (cold, banda larga; gargalo = fontes remotas).
- **Animações em idle: 0** — reveals e ECG são one-shot disparados por IntersectionObserver; nenhum `infinite`, nenhum rAF loop.
- **Modais/banners/widgets no load: 0.** Sem cookie banner (sem cookies), sem chat widget.
- **Terceiros: só Google Fonts** (fonts.googleapis.com + fonts.gstatic.com). **Zero analytics/trackers.**

## Lacunas gerais

Runtime não observado (timing real de animação, render de máscaras SVG, responsividade em viewport real, tamanhos reais dos woff2); screenshots de evals confirmam paleta/layout em baixa resolução.
