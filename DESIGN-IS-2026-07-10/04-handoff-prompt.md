# Handoff — cole o bloco abaixo num `/make-plan`

````
/make-plan Refine a landing page da Dra. Waleska Cid Silva (C:\Projetos\Landing Page WCS — index.html, css/styles.css, js/main.js; estática, sem build) com base num audit Dieter Rams (total 22/30).

Parágrafo do veredito (citado de 03-verdict.md):
> REFINE — total 22/30, nenhum princípio zerado; os ossos são bons — sistema de cor tokenizado, tarefa primária a 1 clique, página de 26 KB sem ruído — e o que falta são acabamentos pontuais, não estrutura.

Keep (já está forte, NÃO tocar neste passe):
- Princípio #2 (useful) pontuou 3 — Evidência: contato WhatsApp a 1 clique de qualquer ponto (index.html:65 header sticky, :84 hero, :197 contato; href wa.me/5527997910392); 7 elementos interativos, zero decoys. Checagem de regressão: grep de `wa.me/5527997910392` deve seguir retornando 3 ocorrências e nenhum CTA novo pode ser adicionado.
- Princípio #5 (unobtrusive) pontuou 3 — Evidência: chrome = 1 header sticky; 0 modais, 0 banners, 0 animações em idle (reveals/ECG são one-shot via IntersectionObserver em js/main.js). Checagem de regressão: nenhum `animation: infinite`, nenhum widget/banner novo, contagem de seções continua 10.

Corrigir em ordem de prioridade (movimentos do audit, verbatim):
1. #4 — understandable: Traduzir o jargão médico para leigo 45+. Reescrever ou glosar os 10 termos da lista de áreas e da bio ("intercorrências"→"problemas de saúde inesperados", "atenção primária"→"cuidado de primeiro contato", "avaliação pré-operatória"→"avaliação antes de cirurgia", "doenças crônicas"→"doenças de longa duração (diabetes, pressão alta)", "encaixes"→"horários para urgências", "laudos e pareceres"→"documentos e relatórios médicos", "manejo de fatores de risco cardiovascular"→"cuidado do coração e da pressão", "medicina preventiva"→"cuidado para evitar doenças", "coordenação do cuidado"→"acompanhamento integrado com outros médicos", "condições agudas"→"problemas de saúde súbitos"). Evidência: index.html:141–157, 171–175. Atenção: manter tom sóbrio CFM — sem infantilizar; a médica deve validar a reescrita.
2. #6 — honest: Exibir o RQE junto ao CRM. Obter o número com a cliente e adicionar em hero (index.html:73), footer (index.html:204) e JSON-LD (index.html:46). Exigência CFM ao anunciar a especialidade MFC, que a página já anuncia. Evidência: BRIEF.md:9; comentários de pendência em index.html:34, 72. Bloqueado por input da cliente — se o número não vier, planejar fallback (remover claim de especialista até ter RQE).
3. #8 — thorough: Adicionar `:active` aos botões (css/styles.css:93–103, também .top__cta css:84–90) e substituir og-image placeholder por raster final 1200×630 (og-image.png; redes não renderizam SVG). Evidência: checklist de estados do audit; og-image.svg placeholder.
4. #3 — aesthetic: Absorver órfãos no sistema — `.brand__name` (css/styles.css:82, 1.05rem fixo) entra na escala --step-*; consolidar micro-espaçamento ad-hoc (~15 valores fixos, ex. css:120–121, 152, 206, 228) num conjunto pequeno de tokens (--space-1..4). Sem mudar o render atual: tokens devem mapear os valores existentes, não redesenhar.
5. #9 — environmentally friendly: Self-host de Fraunces + Hanken Grotesk (woff2, subset latin, font-display: swap) substituindo Google Fonts (index.html:29–31): corta ~7 requests a terceiros, remove dependência externa (bônus LGPD) e melhora TTI (~700 ms estimado, gargalo = fontes remotas).

Fora de escopo neste passe: estrutura das seções (10 seções, ordem atual), paleta (8 tokens em css/styles.css:3–10 — sem teal/ciano, sem terracota), tipografia de marca (Fraunces + Hanken Grotesk, nunca Inter), linha ECG (assinatura), decisão sem-formulário, dark mode (decisão de marca, não incluir), analytics (zero trackers é deliberado).

Restrições permanentes: compliance CFM (sem promessas/superlativos/antes-e-depois; nome + CRM-ES 6410 sempre visíveis), stack vanilla sem build/deps, reduced-motion continua respeitado (css/styles.css:267–272).

Deliverables do plano:
- Por correção: arquivos-alvo, mudança exata, passo de verificação (para copy: aprovação da médica; para CSS: diff visual contra .claude/evals/shot-*.png; para fontes: contagem de requests antes/depois).
- Mudanças de token consolidadas num único lugar (bloco :root de css/styles.css).
- Checklist de regressão para cada item Keep acima.

Anti-padrões a vigiar (específicos de REFINE):
- Não adicionar abstrações onde uma mudança direta basta (sem build step, sem pré-processador).
- Não reestilizar áreas que já pontuaram 3 (CTAs e chrome ficam como estão).
- Sem scope creep para redesign estrutural (se estrutura precisar mudar, é outro veredito).
- Correções não podem vazar para princípios fora da lista (ex.: self-host de fontes não muda tipografia visível).
````
