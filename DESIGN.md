# DESIGN.md — Sistema visual da landing Dra. Waleska Cid Silva

Fonte da verdade dos valores: `css/styles.css` (tokens em `:root`); espelho legível por máquina: `design-tokens.json`. Auditoria que embasa este doc: `DESIGN-IS-2026-07-10/` (Rams, 22/30 → REFINE, fixes aplicados).

## Direção

Sóbria, próxima, humana — nunca fria ou hospitalar. Editorial-tipográfica: o texto é o protagonista; sem grade de cards, cada seção tem ritmo próprio. Paleta **índigo quente** sobre **neutros quentes** (Mio Spa); o dourado (`brasa`) existe só como fio-assinatura.

## Marca (desde 2026-07-11)

- **Símbolo — W-teto (1a):** o W de Waleska com ápice central em telhado; ponto dourado = a pessoa, em casa. Header (inline SVG) e favicon (roundel índigo).
- **Assinatura (1c):** "Waleska *Cid*" em Fraunces, "Cid" itálico azul-500. O nome é a marca — "Médico em Casa" foi aposentado.
- **Linha ECG:** continua como elemento de seção (hero + divisores), não como logo.
- Fonte das direções: `logos/LogoPropostas.pdf` (local, fora do git).

## Decisões e racional

| Decisão | Racional |
|---|---|
| 8 cores, zero hex solto, derivações via `color-mix` | consistência auditável; qualquer cor nova é regressão |
| Fraunces (display) + Hanken Grotesk (corpo), self-hosted | personalidade editorial sem dependência de terceiros (LGPD); nunca Inter |
| Escala de tipo fluida em 6 steps (`clamp`) | hierarquia estável de 320px a 4K sem media queries de fonte |
| Botões pílula, `:hover` + `:active` | affordance clara; motion contida |
| Motion só one-shot via IntersectionObserver | zero animação em idle; `prefers-reduced-motion` desliga tudo |
| Sem dark mode | decisão de marca (superfície paper é identidade) |
| Contraste: todo texto AA+ (pior par real 5.9:1) | falhas de contraste só em fios decorativos sem semântica |

## Anti-slop (modo 3 do skill, veredito)

A página não tem os vícios genéricos: zero gradientes gratuitos, zero glassmorphism decorativo (o blur do header é funcional), zero hero centrado sobre gradiente, serif com personalidade em vez de sans genérica, animação contida. Único item de vigilância: não deixar seções novas importarem padrões de card.

## Regras para mudanças futuras

1. Cor nova = token novo discutido, nunca hex inline.
2. Font-size fora de `--step-*` é regressão (grader pega Inter/teal; steps são por revisão).
3. CTA de WhatsApp: exatamente 3 (header, hero, contato) — não adicionar.
4. Compliance CFM travada: nome + CRM-ES 6410 visíveis; sem superlativos/promessas; rodar `bash .claude/evals/grade.sh` antes de qualquer push.
5. Preview do sistema = o próprio site (`index.html`, sem build). Não há design-preview.html separado — numa página única seria duplicata.
