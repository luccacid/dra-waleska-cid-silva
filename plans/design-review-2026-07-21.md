# Revisão de design — consolidado dos 4 revisores (2026-07-21)

**Escopo:** `index.html`, `css/styles.css`, `js/main.js` · Produção: https://drawaleskacid.com.br/
**Fontes:** revisor visual (screenshots 1280×900 e 375×760), revisor UX, auditoria WCAG 2.2 AA, segunda opinião Codex/GPT.
**Método:** deduplicação (mesmo problema em 2+ fontes = 1 item, confiança maior), filtro contra a direção de design declarada (paleta índigo, Fraunces/Hanken, ECG, retrato no hero) e re-priorização: **alta** = quebra real de layout/fluxo/a11y AA · **media** = prejudica polish ou conversão · **baixa** = nice-to-have.

---

## Sumário executivo

A página está madura: paleta e tipografia fiéis aos tokens, contraste 100% AA (menor razão de texto: 5,06:1), headings/landmarks corretos, sem overflow em 375px, hrefs todos funcionais e compliance CFM parcial visível (nome + CRM-ES 6410). Nenhum achado dos 4 revisores contradiz a direção de design — a crítica se concentra em três frentes:

1. **Publicação/compliance:** o RQE segue ausente com a especialidade anunciada em título, hero, rodapé e JSON-LD — duas fontes independentes apontam; o Codex classifica como bloqueador. É o item nº 1.
2. **Robustez e mobile:** o guard `no-js→js` inline não cobre falha de carregamento do `main.js` (página inteira ficaria `opacity:0`), e o título do hero quebra mal em 375px ("muito" isolado) — ambos com correção barata.
3. **Conversão:** os 3 CTAs de WhatsApp abrem conversa em branco (sem `?text=`) e há ~5 seções sem ação entre o hero e o contato, justamente após o trecho mais persuasivo (teleconsulta). Duas fontes concordam em ambos.

O restante é refino tipográfico (entrelinha 1.6 herdada em 4 títulos display), alinhamento de eixo entre seções contidas e full-bleed, e um lote de miudezas semânticas de a11y. Duas sugestões (CTA extra no meio da página; navegação no header) **tensionam decisões anteriores registradas no repo** (`plans/01-refine-landing.md` congela o grep `wa.me` em 3; o audit DESIGN-IS elogiou "zero decoys") — levar à cliente/editor antes de aplicar, não aplicar de ofício.

**Itens descartados por contradizer a direção:** nenhum. Observações de fronteira: "H2 de modalidades parece legenda" (Codex) pode ser ritmo intencional da seção — mantido como baixa com ressalva; nada tocou paleta, fontes, ECG ou o retrato atrás da linha.

---

## Achados por prioridade

### Alta — quebra real de layout/fluxo/compliance

| # | Achado | Evidência | Correção | Fontes |
|---|--------|-----------|----------|--------|
| A1 | **RQE ausente com especialidade anunciada** (site em produção) | "Medicina de Família e Comunidade" no title, JSON-LD, hero e rodapé (`index.html:34, 41, 74-75, 82, 288`) só com CRM-ES 6410; Resolução CFM de publicidade exige RQE vinculado à especialidade. Pendência 1 do BRIEF, mas o site está no ar assim. | Cobrar o número real da cliente com prioridade máxima; adicionar "· RQE XXXX" ao eyebrow, rodapé e JSON-LD. Não inventar número; se não vier, revisar a redação com quem responde pela publicidade. | ux, codex |
| A2 | **Título do hero quebra mal no mobile** ("muito" isolado; lockup de 3 vira 5 linhas) | Medido em 375×760: os spans `.line` com `display:block` (`index.html:77-79`, `css/styles.css:142`) re-quebram porque "A saúde vai muito" a 48px (mín. do `--step-4`, `styles.css:48`) não cabe em ~335px; reveal animado sai fragmentado. | Reduzir o mínimo do `--step-4` (ex.: `clamp(2.5rem, …)`) até a linha caber em 375px, **ou** tornar os `.line` `display:inline` abaixo de ~480-600px e deixar a quebra natural. | visual, codex |
| A3 | **Falha de carregamento do `main.js` deixa a página inteira invisível** (latente) | O swap `no-js→js` é inline no `<head>` (`index.html:7`) e `.js .reveal { opacity:0 }` (`styles.css:317`) esconde quase todo o conteúdo. Se `js/main.js` der 404/bloqueio/erro de parse, a classe `.js` já foi aplicada e nada revela — todos os usuários veem página em branco. | Mover `document.documentElement.classList.replace('no-js','js')` para a **primeira linha de `js/main.js`** (é `defer`; FOUC mínimo), ou manter o inline e adicionar `onerror` na tag `<script>` revertendo para `no-js`. | a11y |

### Media — prejudica polish ou conversão

| # | Achado | Evidência | Correção | Fontes |
|---|--------|-----------|----------|--------|
| M1 | **CTAs de WhatsApp sem mensagem pré-preenchida** | Os 3 hrefs usam `https://wa.me/5527997910392` sem `?text=` (`index.html:67, 86, 281`); paciente cai em conversa em branco — fricção no último passo, pior para o público 45+/famílias de idosos (persona do BRIEF). | Acrescentar `?text=` com mensagem curta e neutra, ex.: `?text=Ol%C3%A1%2C%20Dra.%20Waleska!%20Gostaria%20de%20marcar%20uma%20consulta.` Variar o texto por origem (hero vs. contato) para rastrear sem analytics. Não altera o grep `wa.me/5527997910392 = 3`. | ux, codex |
| M2 | **Vazio de ação entre hero e contato; teleconsulta termina sem próxima ação** | ~5 seções sem CTA entre `.hero__actions` (`index.html:86`) e `#contato` (`:281`); a seção mais persuasiva (`#teleconsulta`, `:139-210`) termina em parágrafo sobre exames/receitas. Pico de intenção sem saída visível além do sticky pequeno. | **Atenção: tensiona `plans/01-refine-landing.md` ("grep wa.me = 3, não adicionar CTA novo") e o keep #2 do DESIGN-IS ("zero decoys"). Validar antes.** Alternativa mínima que respeita o congelamento: link-âncora "Falar sobre agendamento → #contato" ao fim da teleconsulta (o id existe e nenhum link aponta para ele). | ux, codex |
| M3 | **Títulos display com line-height 1.6 herdado do body** | Medido no browser: `.approach__h` (`styles.css:178`), `.tele__h` (`:212`), `.areas__h` (`:251`), `.contact__h` (`:304`) renderizam 55-61px com entrelinha computada 88-97px; hero usa 0.98 e `.pledge__q` 1.18 — lacunas de ~90px entre linhas, inconsistente com o sistema. | Regra compartilhada com `line-height: 1.15-1.2` para os quatro títulos step-3 (alinhada ao 1.18 do `.pledge__q`). Registrar o valor em `design-tokens.json`/`DESIGN.md` (hoje omissos quanto a entrelinha). | visual |
| M4 | **Eixo esquerdo desalinhado entre seções contidas e faixas full-bleed (desktop); header fora do grid** | Medido em 1280: conteúdo geral inicia em x≈107, mas approach/about/contato em x≈64 — degrau de 43px que cresce até `--gut` (80px) em telas largas; rodapé (x≈107) logo abaixo do contato (x≈64) evidencia. Causa: `max-width` aplicado nos filhos dentro do padding (`styles.css:181, 269, 303`). O `.top` também não tem max-width interno (`:94`). | Nos filhos das faixas, `max-width: calc(var(--maxw) - 2*var(--gut))` — ou um wrapper único `.wrap` padronizado. Adicionar `.top__inner` com `max-width: var(--maxw)` para o header cair no mesmo eixo. | visual, codex |
| M5 | **Retrato do hero termina em corte reto flutuando sobre o paper (desktop)** | Em 1000-1280px o PNG tem fundo mais frio que o paper e aresta horizontal dura (com drop-shadow) a ~20px da borda da faixa índigo (`styles.css:359-364`). No mobile não ocorre (`padding-bottom:0` sangra na faixa); o about já resolve com mask fade (`:280-281`). | Ancorar `bottom:0` (replicar a solução do mobile) **ou** aplicar o mesmo `mask-image` de fade do `.about__photo img` no rodapé do retrato; idealmente aproximar o fundo do PNG ao tom do paper. Não toca a decisão "retrato atrás da linha ECG". | visual |
| M6 | **Responsividade intermediária (720-1050px) frágil** — *verificar em viewport real antes de mexer* | Codex: teleconsulta/áreas viram 2 colunas já a 720px (`styles.css:344-346`) com subcolunas estreitas; a partir de 900px o retrato vira `absolute` até 36vw (`:354-362`) sem o título (14ch, `:137-140`) reservar coluna — risco de colisão em 900-1050px. Único revisor; screenshots dos demais foram só 1280 e 375. | Reproduzir em 768/900/1024px. Se confirmar: segurar o empilhamento até ~900-960px e ativar subcolunas da lista só com ≥520px disponíveis; no hero, grid de 2 colunas com a imagem na coluna visual (ECG segue absoluto por cima, preservando a decisão da cliente). | codex |
| M7 | **Endereço e horários ausentes na etapa de conversão** | `#contato` mostra só "Grande Vitória — ES" (`index.html:276-279`); quem quer presencial precisa perguntar tudo pelo WhatsApp. Pendência 3 do BRIEF — a fricção de conversão mais concreta hoje. | Priorizar a obtenção com a cliente; ao ter os dados, exibir antes dos botões e adicionar ao JSON-LD (`PostalAddress`/`openingHoursSpecification`), como o comentário da linha 276 já prevê. Não preencher com provisório fictício. | ux, codex |
| M8 | **Offsets de âncora duplicados: `scroll-padding` + `scroll-margin` somam** | `html { scroll-padding-top: 5.5rem }` (`styles.css:53`) **e** `:target { scroll-margin-top: 5.5rem }` (`:54`) — verificado no código; na navegação por âncora os dois se acumulam (~11rem), deixando faixa grande da seção anterior visível acima do alvo. | Manter só `scroll-padding-top` no `html` (idealmente variável igual à altura real do header) e remover o `scroll-margin-top` global de `:target`. Uma linha. (Rebaixado de "alta" do Codex: degrada, não quebra.) | codex |
| M9 | **Prova de credibilidade ("Sobre") chega tarde** — *decisão de arquitetura, validar com a cliente* | UFES, +25 anos, +5000 visitas e foto só na 5ª/6ª tela (`index.html:243-265`), depois da teleconsulta longa e das 12 áreas. O hero mitiga (retrato + CRM no eyebrow). | Opções: mover "Sobre" para antes de `#teleconsulta`, ou puxar uma linha de credencial ("Formada pela UFES · +25 anos · +5000 visitas domiciliares") para perto do topo. Não aplicar sem aval. | ux |
| M10 | **Link "Mais sobre a teleconsulta" com alvo de toque pequeno** (WCAG 2.2 AA 2.5.8) | `.mode__link` em step--1 (~13.4px, altura ~21px, `styles.css:203`) — abaixo dos 24px mínimos; link isolado (a exceção "inline em texto corrido" tende a não se aplicar) e é o único caminho interno à seção de teleconsulta. | `padding-block: ~0.35em` para chegar a ≥24px de alvo e/ou subir para step-0; manter sublinhado e `text-underline-offset` atuais. | visual |
| M11 | **Teleconsulta densa; conteúdo decisivo escondido em `<details>` fechados** | As 3 categorias de situações nascem colapsadas (`index.html:167-204`) — invisíveis para quem não clica e para Ctrl+F sem auto-expand; a página vira "catálogo" entre teleconsulta e as 12 áreas, com sobreposição entre as listas. | Abrir o primeiro `<details>` com `open` (sinaliza o padrão) ou citar 2-3 exemplos no `<summary>` ("Saúde mental — ansiedade, insônia…"); revisar duplicações entre situações e áreas. | ux, codex |
| M12 | **Sem navegação entre seções** — *validar: tensiona o header minimalista elogiado no DESIGN-IS* | Header só com marca + CTA (`index.html:58-68`) numa página de ~6 telas; não dá para ir direto a Sobre/Áreas/Contato. | Se a cliente topar: nav curta no desktop (Atendimento · Sobre · Contato), solução compacta no mobile. Sem menu complexo. | codex |

### Baixa — nice-to-have

| # | Achado | Evidência | Correção | Fontes |
|---|--------|-----------|----------|--------|
| B1 | ECG subutilizado como divisor (direção diz "hero + divisores", plural; existe 1) | Único `.divider` em `index.html:213` | +1-2 divisores em transições claras (antes do pledge, ou áreas→about), com parcimônia | visual |
| B2 | Rótulos de CTA inconsistentes para a mesma ação | "Marcar consulta" / "Falar pelo WhatsApp" / "WhatsApp · (27)…" (`index.html:67, 86, 281`) | Padronizar no verbo de valor: "Marcar consulta pelo WhatsApp" no hero; manter número visível no contato | ux |
| B3 | Sem opção de ligação (`tel:`) para o público que prefere ligar | Número só como rótulo do botão de WhatsApp (`index.html:280-283`) | Link `tel:+5527997910392` na seção de contato; WhatsApp segue primário | ux |
| B4 | Logo do header com `href="#"` | `index.html:59` — suja a URL, link sem destino significativo para SR | Trocar por `href="#conteudo"` ou `/` | ux |
| B5 | Indicadores +/− do accordion anunciados por leitores de tela | `summary::after { content:"+" }` (`styles.css:235-236`) | Sintaxe de texto alternativo vazio: `content: "+" / "";` e `content: "−" / "";` | a11y |
| B6 | Sub-rótulos da teleconsulta são `<p>` mas funcionam como headings | `p.tele__sub` (`index.html:156, 165`) fora do outline (tecla H) | Trocar por `<h3 class="tele__sub">` mantendo a classe | a11y |
| B7 | Links `target="_blank"` sem aviso de nova aba | `index.html:67, 86, 259, 281` (G201, advisory) | `<span class="sr-only">(abre em nova aba)</span>` + utilitária `.sr-only` | a11y |
| B8 | Alvo do skip-link sem `tabindex="-1"` | `<main id="conteudo">` não focável (`index.html:56, 70`) | `tabindex="-1"` no main (+ `main:focus { outline:none }` se preciso) | a11y |
| B9 | Header sem tratamento para 320-360px | Marca + wordmark + CTA + gutters (`styles.css:94-101`); `overflow-x:hidden` no body pode mascarar (`:66`) | Abaixo de ~360px: ocultar wordmark, reduzir gaps, CTA "Agendar", alvo ≥44px | codex |
| B10 | Transparência do header (86% + blur) cria faixa "suja" sobre a faixa índigo | `styles.css:99-100` | Aumentar opacidade ou fundo sólido após scroll | codex |
| B11 | H2 "Onde atendo você" menor que os H3 da seção — *pode ser ritmo intencional ("cada seção com ritmo próprio")* | H2 em `--step--1` (`styles.css:192`) vs. H3 em `--step-2` (`:200`) | Se incomodar: manter o texto como eyebrow e adicionar H2 editorial | codex |
| B12 | Animação de reveal uniforme; stagger 2n/3n em vez de progressivo | `styles.css:317-331` | Animar blocos maiores; índices progressivos só onde a cascata paga | codex |
| B13 | ECG muda de morfologia entre viewports (`preserveAspectRatio="none"`) | `index.html:92, 214` | Pulso central com proporção fixa + laterais flexíveis; `vector-effect="non-scaling-stroke"` | codex |
| B14 | `<ol>` para modalidades sem ordem real | `index.html:121`; o próprio CSS admite (`styles.css:199`) | Trocar por `<ul>`; visual não muda | codex |
| B15 | Sobre: vazio à direita e halo branco da foto sobre o sand (1280px) | Texto termina ~150px antes da foto; vignette branca embutida no PNG vs. `#E6DAC8` (`styles.css:275-283`) | Centrar texto verticalmente ou reduzir foto p/ ~320px; tratar vignette no tom do sand ou confiar só no `mask-image` | visual |

---

## Quick wins (melhor custo-benefício)

1. **Entrelinha dos títulos display (M3)** — 1 regra CSS compartilhada (`line-height: 1.18`) conserta 4 títulos de uma vez; maior salto de polish por linha de código. Registrar o token.
2. **`?text=` nos 3 links de WhatsApp (M1)** — 3 edições de href, zero risco, ataca diretamente a conversão; não viola o congelamento de CTAs (continua = 3).
3. **Robustez do reveal (A3)** — mover o `classList.replace('no-js','js')` para a 1ª linha de `js/main.js` (ou `onerror` na tag). Uma linha elimina o único cenário de "página em branco para todos".
4. **Remover `scroll-margin-top` de `:target` (M8)** — deletar 1 linha (`styles.css:54`) corrige o offset duplo de todas as âncoras.
5. **Lote semântico de 15 minutos (B4, B5, B6, B14)** — `href="#"`→`#conteudo`, `content: "+" / ""`, `p.tele__sub`→`h3`, `<ol>`→`<ul>`. Quatro micro-edições sem impacto visual.

**Não aplicar sem validação:** M2 (CTA extra — congelado em `plans/01-refine-landing.md`), M9 (mover "Sobre"), M12 (nav no header). **Depende da cliente:** A1 (RQE — cobrar já), M7 (endereço/horários).
