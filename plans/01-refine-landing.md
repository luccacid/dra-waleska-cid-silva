# Plano de melhoria — Landing Dra. Waleska Cid Silva (conteúdo + design)

Base: audit Rams 22/30 (`DESIGN-IS-2026-07-10/`) + novo conteúdo de teleconsultas fornecido pela cliente (2026-07-10).
Execução: cada fase é autocontida e pode rodar numa sessão nova. Stack: HTML/CSS/JS vanilla, **sem build, sem deps**.

## Fase 0 — Descoberta (CONCLUÍDA nesta sessão)

Fontes lidas, com evidência em `DESIGN-IS-2026-07-10/01-evidence.md`:
- `index.html` (estrutura: 10 seções, padrões de section com `aria-labelledby`, eyebrow `.section-label`, lista editorial `.areas__list`), `css/styles.css` (tokens :3–26, estados :62–68/90–103/267–272), `js/main.js` (reveals + ECG).
- `BRIEF.md` (pendências: RQE :9, foto, endereço, horários), `CLAUDE.md` (direção: índigo, Fraunces+Hanken, sem teal/terracota, nunca Inter, sem grade de cards).
- Harness de avaliação existente: `.claude/evals/grade.sh` + `.claude/evals/landing-page.md` (usar na verificação final).

**APIs/padrões permitidos:** só HTML semântico + CSS moderno (`clamp`, `color-mix`, `text-wrap`) + `IntersectionObserver` — os já usados. Para conteúdo expansível, `<details>/<summary>` nativo é permitido (rung nativo; sem JS novo).
**Anti-padrões:** framework/lib, build step, grade de cards, cores fora dos 8 tokens, Inter, formulário de contato, tracker.

---

## Fase 1 — CONTEÚDO: nova seção Teleconsulta (texto da cliente)

**O que:** inserir o conteúdo "Teleconsultas: cuidado médico onde você estiver" como seção própria `#teleconsulta`, entre `.modes` (fecha ~index.html:128) e o divisor ECG (:131). Linkar a partir do item "Teleconsulta" da seção modes (index.html:121) com âncora.

**Como (copiar padrões existentes, não inventar):**
- Estrutura da section: copiar o esqueleto de `.areas` (index.html:139–159) — `<section aria-labelledby>`, eyebrow `.section-label`, heading serif, lead.
- As 3 listas (problemas agudos / crônicas / saúde mental) são longas: usar **um `<details>` por grupo** (nativo, fechado por padrão, `<summary>` estilizado com o padrão tipográfico de `.mode__t` css:167) OU colunas editoriais como `.areas__list` (css:176–192). Decidir pelo render — testar os dois, escolher o que não alonga demais o scroll. Sem grade de cards.
- Reveals: adicionar `class="reveal"` como nas seções vizinhas (js/main.js observa `.reveal` automaticamente — nada de JS novo).

**Passe de compliance CFM no texto (antes de publicar; médica valida):**
| Original | Risco | Sugestão |
|---|---|---|
| "forma prática, segura e eficiente" | claim de qualidade | "forma prática e regulamentada de receber atendimento" |
| "É uma excelente opção" | superlativo | "É uma boa opção" / "Está indicada" |
| "costuma ser bastante resolutiva" | promessa implícita | "situações que costumam ser bem atendidas por teleconsulta" |
| "atendimento rápido" | promessa de agilidade | "atendimento sem deslocamento" |
- Manter intacto o parágrafo de limitação ("suspeita de condição que exija exame físico… serviço presencial") — ele é o contrapeso honesto da seção; dar-lhe destaque tipográfico (itálico serif, padrão `.pledge` css:211–218).
- **Reconciliar duplicações** com "Áreas de atuação" (index.html:145–157): renovação de receitas, interpretação de exames, atestados e saúde mental já aparecem lá. Regra: a lista de áreas fica genérica; detalhe fica só em `#teleconsulta`. Remover da nova seção o parágrafo-resumo redundante ("Também é possível realizar renovação de receitas…") se as listas já cobrirem, ou encurtá-lo a uma linha.

**Verificação:**
- [ ] Âncora `#teleconsulta` navega com header sticky sem cobrir o heading (scroll-padding css:30–31 já cobre; testar).
- [ ] Grep `wa.me/5527997910392` continua = 3 (não adicionar CTA novo na seção; a tarefa primária já tem 3 pontos de contato — keep #2 do audit).
- [ ] Texto final aprovado pela médica (mensagem com o diff de copy).
- [ ] Reveal funciona no mobile (regressão do bug 988986c: transform/translateX no estado revelado).

**Guardas:** não criar componente/JS novo; não usar cores fora dos tokens; nenhum superlativo sobrevive sem aprovação explícita da médica.

## Fase 2 — CONTEÚDO: jargão → linguagem de paciente + RQE

**O que (audit fix #4-understandable):** aplicar a tabela de substituições em `index.html:141–157` (áreas) e `:171–175` (bio): "intercorrências"→"problemas de saúde inesperados", "atenção primária"→"cuidado de primeiro contato", "avaliação pré-operatória"→"avaliação antes de cirurgia", "doenças crônicas"→"doenças de longa duração (diabetes, pressão alta)", "encaixes"→"horários para urgências", "laudos e pareceres"→"documentos e relatórios médicos", "manejo de fatores de risco cardiovascular"→"cuidado do coração e da pressão", "medicina preventiva"→"cuidado para evitar doenças", "coordenação do cuidado"→"acompanhamento integrado com outros médicos", "condições agudas"→"problemas de saúde súbitos". Tom sóbrio, sem infantilizar; aplicar também nos textos novos da Fase 1 (que reintroduzem "agudas", "crônicas" — glosar na primeira ocorrência e depois usar livre).

**RQE (audit fix #6-honest, BLOQUEADO por input):** pedir o número à cliente. Quando vier: hero `index.html:73`, footer `:204`, JSON-LD `:46` (padrão "CRM-ES 6410 · RQE NNNN"). Se não vier até publicar a Fase 1: manter como está e registrar a pendência (não remover o claim sem falar com a cliente — decisão dela).

**Verificação:**
- [ ] Grep dos 10 termos originais → 0 ocorrências sem glosa.
- [ ] Aprovação da médica no diff de copy (mesma mensagem da Fase 1).
- [ ] CRM-ES 6410 continua visível em hero/footer/JSON-LD (grep = 3).

**Guardas:** meta description/OG/JSON-LD (index.html:8–46) mudam junto se o texto citado mudar; não tocar em claims não listados.

## Fase 3 — DESIGN: acabamentos (audit fixes #8 e #3)

**O que:**
1. `:active` nos botões: adicionar em `css/styles.css` junto aos hovers (:90, :101, :103) — ex. `transform: translateY(0) scale(.98)` — e no `.top__cta`.
2. og-image raster final: gerar `og-image.png` 1200×630 a partir do `og-image.svg` (marca MwC índigo) e conferir que `index.html:20` aponta pro PNG.
3. `.brand__name` (css:82) entra na escala: `font-size: var(--step-0)` se o render aguentar (comparar com screenshot) — senão criar token `--step-brand` documentado no :root.
4. Micro-espaçamento: criar `--space-1: 0.5rem; --space-2: 1rem; --space-3: 1.5rem; --space-4: 2.5rem` no :root e mapear os ~15 valores fixos (css:74–75, 80, 94–96, 120–121, 152, 167–169, 206, 228, 233) para o token mais próximo **sem mudar o render** (arredondamentos ≤0.1rem ok).

**Verificação:**
- [ ] Diff visual contra `.claude/evals/shot-desktop.png` e `shot-mobile-approach.png` (rodar `python -m http.server` + screenshots; tolerância: nada perceptível além do og/brand).
- [ ] `:active` visível em teste manual de clique.
- [ ] og-image renderiza em validador de OG (ex. opengraph.xyz).

**Guardas:** reduced-motion (css:267–272) continua cobrindo qualquer transição nova; não reestilizar CTAs além do :active (keep #5).

## Fase 4 — DESIGN/PERF: self-host das fontes (audit fix #9)

**O que:** baixar Fraunces (400/500 + itálico 400, opsz 9..144) e Hanken Grotesk (400/500/600) em woff2 subset latin (ex. via gstatic ou google-webfonts-helper), colocar em `fonts/`, escrever os `@font-face` com `font-display: swap` no topo de `css/styles.css`, remover `index.html:29–31` (preconnects + link).

**Verificação:**
- [ ] DevTools Network: 0 requests a `fonts.googleapis.com`/`fonts.gstatic.com`; total de requests cai de 11 para ~9 locais.
- [ ] Render idêntico (Fraunces itálico do hero `em` e pesos 500/600 do Hanken presentes — testar hero, brand, botões).
- [ ] Peso total dos woff2 reportado no PR (< ~150 KB esperado com subset).

**Guardas:** variable font da Fraunces precisa manter o eixo opsz usado — se o subset estático perder o render do display, usar o variable woff2 completo; nunca trocar de família.

## Fase 5 — VERIFICAÇÃO FINAL (roda após qualquer sequência de fases)

1. Harness existente: `.claude/evals/grade.sh` (graders incluem visibilidade de CRM com UF).
2. Greps de regressão: `wa.me/5527997910392` = 3; `animation.*infinite` = 0; `Inter` = 0; nenhum hex novo fora dos 8 tokens (conferir manualmente qualquer hex adicionado); `fonts.googleapis` = 0 (pós-Fase 4).
3. CFM: nome+CRM visíveis, zero superlativos/promessas (re-rodar grep de "melhor|garantia|excelente|rápido" no HTML), disclaimer intacto (index.html:205).
4. Mobile: reveals nas seções novas (regressão 988986c), âncoras sob header sticky.
5. Deploy: commit por fase, push para main (GitHub Pages) só após o item 1–4 verde.

## Ordem e dependências

- Fase 1 e 2 são o passe de **conteúdo** (mesma aprovação da médica; RQE pode chegar depois sem bloquear).
- Fase 3 e 4 são o passe de **design/perf**, independentes entre si e do conteúdo.
- Fora de escopo (decisões já tomadas — não revisitar): estrutura das 10 seções, paleta, ECG, sem-formulário, dark mode, analytics.
