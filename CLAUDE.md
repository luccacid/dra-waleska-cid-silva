# CLAUDE.md — Landing Page Dra. Waleska Cid Silva

Landing page única de médica. **Fonte da verdade:** `BRIEF.md` (consolidado do PDF + assinatura).
Briefing de direção: `instruções.md`.

## Stack (ponytail: sem build)
HTML semântico + CSS moderno + JS vanilla. **Sem framework, sem bundler, sem deps.**
Animação por `IntersectionObserver` + CSS (sem GSAP/Lenis — não se pagavam aqui).
Site estático puro → deploy direto (GitHub Pages).

## Arquivos
- `index.html` — markup + JSON-LD `Physician` + metas/OG.
- `css/styles.css` — tokens, layout por seção, motion, responsivo, reduced-motion.
- `js/main.js` — reveals e desenho da "linha de cuidado" (ECG).
- `favicon.svg`, `og-image.svg` — marca **W-teto + assinatura "Waleska Cid"** (logos/LogoPropostas.pdf, direções 1a+1c): W com ápice-telhado, ponto dourado (brasa) = pessoa em casa; wordmark serif com "Cid" itálico.

## Rodar
Abrir `index.html` no navegador (ou `python -m http.server`). Sem passo de build.

## Direção (não regredir)
- Paleta: **azul quente índigo** (#2A4068/#3C5A88) + neutros quentes Mio Spa. **Sem teal/ciano, sem terracota.**
  (A marca original é teal — recolorida de propósito; ver pendência 4 do BRIEF.)
- Tipografia: Fraunces (display) + Hanken Grotesk (corpo). **Nunca Inter.**
- Elemento-assinatura: linha ECG ("linha de cuidado") — hero + divisores.
- Sem grade de cards; cada seção com ritmo próprio.

## Compliance
CFM: nome + CRM 6410 visíveis; sem promessas/superlativos/antes-e-depois.
Pendências (UF do CRM, RQE, foto, endereço, horários): ver `BRIEF.md`.
Sem formulário → contato direto WhatsApp/e-mail (sem camada LGPD de formulário).
