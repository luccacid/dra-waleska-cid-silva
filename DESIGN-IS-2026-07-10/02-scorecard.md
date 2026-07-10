# Scorecard — Rams 10, âncoras verbatim, empate → nota menor

1. Good design is innovative — Score: 2/3
   Evidence: linha ECG como assinatura de marca (index.html:90, 131; css:133–138); sem grade de cards, seções com ritmo próprio (E1).
   Justification: refresca o padrão "landing médica" com melhoria clara (identidade tipográfica + ECG), mas landing editorial tipográfica não é padrão inédito em 5+ pares — não é 3; está acima de imitação com variação menor — não é 1.

2. Good design makes a product useful — Score: 3/3
   Evidence: E1 — tarefa primária (contato WhatsApp) a 1 clique de qualquer ponto (header sticky :65, hero :84, contato :197); 7 interativos, zero decoys.
   Justification: caminho mínimo possível para a tarefa, sem ações-isca — nada abaixo de 3 se justifica.

3. Good design is aesthetic — Score: 2/3
   Evidence: E2 — cor 100% tokenizada, tipo em escala de 6 steps; 2 inconsistências: `.brand__name` fora da escala (css:82) e micro-espaçamento ad-hoc (~15 valores fixos).
   Justification: exatamente ≤2 inconsistências menores (âncora do 2); o micro-espaçamento ad-hoc impede o "sistema único visível" exigido pelo 3.

4. Good design makes a product understandable — Score: 2/3
   Evidence: E3 — todos os controles nomeiam corretamente sua ação ("Falar pelo WhatsApp"→wa.me), mas 10 termos de jargão médico no conteúdo (index.html:141–157, 171–175) para público leigo 45+.
   Justification: controles perfeitos negariam o 1, mas jargão presente no conteúdo primário nega o 3; empate 3/2 resolve para baixo.

5. Good design is unobtrusive — Score: 3/3
   Evidence: E1/E4 — chrome = 1 header sticky discreto; 0 modais, 0 banners, 0 animação em idle; decoração (ECG, brasa) sutil e contextual (E2: fios, não áreas).
   Justification: conteúdo é figura, UI é fundo; nada compete com o texto — âncora do 3 atendida.

6. Good design is honest — Score: 2/3
   Evidence: E3 — zero inflações, zero dark patterns, rótulo→href 100% consistente; porém anuncia especialidade MFC (index.html:73, 204, JSON-LD:41) sem RQE (pendência BRIEF:9).
   Justification: uma única lacuna de lastro (especialidade sem RQE exibido — exigência CFM) ≈ "≤1 inflação menor" da âncora 2; sem ela seria 3.

7. Good design is long-lasting — Score: 2/3
   Evidence: linguagem tipográfica sóbria, neutros quentes, zero gradientes-moda (E2); 1 marcador datável: `backdrop-filter: blur(8px)` no header (css:77), idioma 2020s.
   Justification: 1 marcador datado = âncora exata do 2; o restante (serif editorial + paleta contida) tende a envelhecer bem.

8. Good design is thorough down to the last detail — Score: 2/3
   Evidence: E2 — focus-visible ✓ (com variante para faixas escuras, css:68), hover ✓, reduced-motion ✓, skip-link ✓; `:active` ausente nos botões (css:93–103); og-image raster ainda placeholder (E3).
   Justification: 1 estado aplicável faltando (:active) = âncora do 2; estados de dados (empty/loading/error) não se aplicam a estática sem form.

9. Good design is environmentally friendly — Score: 2/3
   Evidence: E4 — 1,2 KB de JS, ~26 KB total próprio, 0 animação em idle, reduced-motion respeitado, zero trackers; sem dark mode (nenhum `prefers-color-scheme`, E2); 11 requests dos quais ~7 são Google Fonts.
   Justification: âncora do 3 exige dark mode honrado — ausente; âncoras 1/0 não descrevem a página (26 KB, motion gated), fica o 2.

10. Good design is as little design as possible — Score: 2/3
    Evidence: E1 — zero código morto, 7 interativos; porém 2 elementos removíveis sem quebrar a tarefa: divisor ECG decorativo (index.html:131) e bullets brasa (css:168, 192).
    Justification: "remover qualquer um quebra a tarefa" (âncora 3) não vale para os decorativos; ≤2 removíveis = âncora exata do 2.

**Total: 22/30** (máx 30; sem zeros; dois 3s: #2 useful, #5 unobtrusive)
