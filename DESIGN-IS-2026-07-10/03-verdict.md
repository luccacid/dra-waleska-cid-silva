# Veredito

**REFINE** — total 22/30, nenhum princípio zerado (regra da Fase 3: ≥20 e sem 0 → REFINE); os ossos são bons — sistema de cor tokenizado, tarefa primária a 1 clique, página de 26 KB sem ruído — e o que falta são acabamentos pontuais, não estrutura.

## Movimentos de maior alavancagem (em ordem de prioridade)

1. **#4 understandable — Traduzir o jargão médico para leigo 45+.** Reescrever ou glosar os 10 termos da lista de áreas e da bio ("intercorrências"→"problemas de saúde inesperados", "atenção primária"→"cuidado de primeiro contato", "avaliação pré-operatória"→"avaliação antes de cirurgia" etc.). Evidence: index.html:141–157, 171–175 (E3, tabela de substitutos).
2. **#6 honest — Exibir o RQE junto ao CRM.** Obter o número com a cliente e adicioná-lo em hero (index.html:73), footer (204) e JSON-LD (46); é exigência CFM ao anunciar a especialidade MFC, que a página já anuncia. Evidence: BRIEF:9; index.html:34, 72 (comentários de pendência).
3. **#8 thorough — Fechar os acabamentos de interação e share.** Adicionar `:active` aos botões (css/styles.css:93–103) e substituir o og-image placeholder por raster final 1200×630 (redes não renderizam o SVG). Evidence: E2 checklist de estados; E3 lacunas.
4. **#3 aesthetic — Absorver os órfãos no sistema.** `.brand__name` (css:82) entra na escala de tipo (--step-0 ou token novo); consolidar o micro-espaçamento ad-hoc (~15 valores) num conjunto pequeno de tokens (ex.: --space-1..4). Evidence: E2.
5. **#9 environmentally friendly — Self-host das fontes.** Servir Fraunces + Hanken Grotesk como woff2 locais com subset latin: corta ~7 requests a terceiros, remove dependência do Google Fonts (bônus LGPD/privacidade) e melhora o TTI estimado. Evidence: E4 (11 requests, gargalo = fontes remotas).

## Anti-padrões checados no próprio veredito

- Não é REFINE por custo afundado: a nota manda REFINE mecanicamente.
- Nenhuma tela isolada justificaria REDESIGN; nenhum princípio load-bearing (#2, #4, #6) está em 0 — #2 está em 3.
