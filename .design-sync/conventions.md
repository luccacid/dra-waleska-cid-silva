# Identidade — Dra. Waleska Cid Silva (Médico em Casa)

Marca de médica de família com atendimento domiciliar. Tom: cuidado próximo, sóbrio, humano. Não há biblioteca de componentes — este projeto fornece só a identidade (tokens, fontes, idiomas de estilo em `styles.css`); construa a UI com HTML/CSS próprios usando esse vocabulário.

## Cores (use os tokens, nunca hex solto)
- Superfícies: `var(--paper)` #F2ECE2 (fundo padrão), `var(--sand)` #E6DAC8 (faixa alternativa clara).
- Texto: `var(--ink)` #1A2230 sobre claro; `var(--paper)` sobre escuro.
- Marca: `var(--azul-700)` #2A4068 (primário — CTAs, títulos de destaque, faixa escura) e `var(--azul-500)` #3C5A88 (itálicos, ênfase); apoios `var(--azul-300)`, `var(--azul-100)`.
- `var(--brasa)` #C39A5B: só fios decorativos e detalhes-assinatura, nunca área grande nem texto.
- **Proibido:** teal/ciano, terracota, e qualquer cor fora dos tokens.

## Tipografia
- Títulos: `var(--serif)` (Fraunces), peso 400, tracking negativo — já aplicado em `h1/h2/h3`. Ênfase com `<em>` (itálico azul-500).
- Corpo e UI: `var(--sans)` (Hanken Grotesk) 400/500/600. **Nunca Inter.**
- Escala fluida: `--step--1` a `--step-4`. Eyebrows/rótulos: classe `.eyebrow`.

## Idiomas de estilo (classes reais em styles.css)
- Botões: `.btn .btn--primary` (índigo sólido) e `.btn .btn--ghost` (contorno). Pílula, nunca cantos retos.
- Seções de destaque: `.band--dark` (índigo) ou `.band--ink` (quase-preto) — ghost buttons e foco se adaptam sozinhos dentro delas.
- Layout: largura máx `var(--maxw)`, gutter `var(--gut)`. Sem grade de cards uniforme; cada seção com ritmo próprio.

## Compliance (médica — CFM/Brasil)
- Sempre exibir "Dra. Waleska Cid Silva — CRM-ES 6410" quando houver identificação profissional.
- Sem promessas de resultado, superlativos ("a melhor"), preços promocionais ou antes-e-depois.
- Contato: WhatsApp e e-mail diretos; não criar formulários de captura.

## Exemplo idiomático
```html
<section class="band--dark" style="padding: 5rem var(--gut);">
  <p class="eyebrow" style="color: var(--azul-100);">Atendimento domiciliar</p>
  <h2>Cuidado que <em>vai até você</em></h2>
  <a class="btn btn--primary" href="#">Agendar pelo WhatsApp</a>
  <a class="btn btn--ghost" href="#">Conhecer o atendimento</a>
</section>
```

Antes de estilizar, leia `styles.css` deste projeto — ele é a fonte da verdade dos tokens e classes.
