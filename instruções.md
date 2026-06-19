\# PROMPT — Landing Page de Médico (build criativo, identidade forte, anti-IA)



> \*\*Como usar este arquivo:\*\* coloque-o na raiz da pasta do projeto (ex.: `./PROMPT.md` ou `./.claude/PROMPT.md`) e aponte o Claude Code para ele. Os \*\*documentos com as informações reais da landing page já estão nesta pasta\*\* — eles são a fonte da verdade. Leia-os \*\*antes\*\* de qualquer linha de código.



\---



\## 0. Missão



Construir \*\*uma\*\* landing page de médico que pareça desenhada por um estúdio de design — não gerada por IA. Página única, marcante, com identidade visual forte, animação intencional e código enxuto. Nada de "kit de template": sem grade infinita de cards, sem herói genérico com número gigante + gradiente, sem layout que serviria para qualquer empresa.



\*\*Não-negociáveis:\*\*

1\. Todo conteúdo (nome, especialidade, serviços, bio, credenciais, contato) vem \*\*dos documentos da pasta\*\*. Nada inventado — especialmente afirmações médicas.

2\. Identidade visual derivada deste brief, não de padrões de IA (ver §6 e §13).

3\. Conformidade com as regras de publicidade médica do \*\*CFM\*\* e com a \*\*LGPD\*\* (ver §9).

4\. Piso de qualidade obrigatório: responsivo até mobile, foco de teclado visível, `prefers-reduced-motion` respeitado, HTML semântico, performance dentro do orçamento (§10).



\---



\## 1. Fonte da verdade: leia a pasta primeiro



Antes de desenhar ou codar, execute a fase de \*\*descoberta\*\*:



1\. Liste e leia \*\*todos\*\* os arquivos de conteúdo desta pasta (`.md`, `.txt`, `.docx`, `.pdf`, imagens, logos, qualquer briefing). Não pule nenhum.

2\. Extraia e consolide num arquivo `BRIEF.md` (rascunho interno) os seguintes campos — marcando `\[FALTANDO]` no que não existir:

&#x20;  - Nome do(a) médico(a) e \*\*CRM\*\* (+ \*\*RQE\*\* se especialista)

&#x20;  - Especialidade(s) e subespecialidades

&#x20;  - Serviços / procedimentos / áreas de atuação

&#x20;  - Bio, formação, títulos, experiência

&#x20;  - Diferenciais reais (abordagem, público, valores)

&#x20;  - Localização, endereço, horários, formas de contato (telefone, WhatsApp, e-mail)

&#x20;  - Convênios / particular (se mencionado)

&#x20;  - Fotos e ativos disponíveis (caminho de cada um, orientação, qualidade)

&#x20;  - Tom de voz desejado, referências, restrições do cliente

3\. \*\*Não invente\*\* conteúdo para preencher buracos. Se algo essencial faltar (ex.: CRM, foto do herói), registre em `BRIEF.md` na seção `## Pendências para o cliente` e siga com placeholder claramente marcado (`<!-- FALTANDO: ... -->`), nunca com texto fictício que pareça real.

4\. Se algum documento sugerir conteúdo que viola o CFM (promessa de resultado, "antes e depois" sensacionalista, "melhor da cidade", depoimento com promessa de cura), \*\*sinalize\*\* em `BRIEF.md` e proponha alternativa conforme — não reproduza como veio.



\---



\## 2. Stack técnica (enxuta por padrão)



A não ser que os documentos da pasta exijam outra coisa (ex.: integração com CMS, projeto Next existente), use o stack abaixo. É leve, rápido e some com complexidade desnecessária — alinhado ao `ponytail`.



\- \*\*Build:\*\* Vite + TypeScript

\- \*\*Base:\*\* HTML semântico + CSS moderno (custom properties, `clamp()`, container/`@media`, grid/flex). Sem framework de UI.

\- \*\*Animação:\*\* GSAP + ScrollTrigger; \*\*Lenis\*\* para smooth scroll. (Avalie `View Transitions` / `IntersectionObserver` nativos quando bastarem — não puxe lib se CSS resolve.)

\- \*\*Sem dependências supérfluas.\*\* Cada lib precisa justificar seu peso (ver `ponytail`, §4). Nada de jQuery, nada de kit de componentes, nada de CSS framework genérico.

\- \*\*Deploy-ready:\*\* saída estática, sem segredos no client, assets otimizados.



> Se o projeto da pasta já tiver um stack definido, \*\*adapte-se a ele\*\* e diga no PR o que mudou e por quê.



\---



\## 3. Antes de construir: configure contexto e memória



1\. \*\*`ecc`\*\* — use para estabelecer o contexto de engenharia do projeto e as convenções (estrutura, padrões de código, organização). Gere/atualize o `CLAUDE.md` do projeto com: objetivo, stack, scripts (`dev`/`build`/`preview`), comandos de teste e de auditoria, e as regras deste prompt resumidas. \*(Se o `ecc` no seu setup tiver outra função, use-o para o que ele faz melhor e registre em `CLAUDE.md`.)\*

2\. \*\*`mem`\*\* — abra um registro de decisões de projeto. A partir daqui, \*\*toda decisão de design e tudo que já foi tentado\*\* (paleta testada, tipografia descartada, layout rejeitado, bug de animação resolvido) vai pra memória. Isso impede o agente de repetir tentativas e de "esquecer" a direção entre passos. Releia a memória no início de cada passo grande.



\---



\## 4. Plugins — papel de cada um



Use \*\*todos\*\* os cinco, cada um no seu domínio. Não deixe nenhum só "instalado".



| Plugin | Dono de | Quando acionar |

|---|---|---|

| \*\*harness\*\* | \*\*Orquestração\*\*: projetar o time de agentes especializados e gerar as skills que eles usam (§5). | No início, para montar o time. É o maestro do build. |

| \*\*ui-ux\*\* | \*\*Sistema visual\*\*: tokens, escala tipográfica, paleta aplicada, hierarquia, e \*\*QA de design\*\* (revisão crítica, heurísticas de usabilidade, acessibilidade visual). | Na fase de design e em toda crítica de tela. |

| \*\*mem\*\* | \*\*Memória persistente\*\*: decisões, tentativas, motivações, estado entre passos. | Continuamente. Ler no começo, escrever no fim de cada passo. |

| \*\*ecc\*\* | \*\*Engenharia/contexto\*\*: convenções, `CLAUDE.md`, qualidade e organização de código. | Setup e ao longo do build como guarda de qualidade. |

| \*\*ponytail\*\* | \*\*Restrição de implementação\*\*: a solução mais simples que funciona. Cortar over-engineering, dependências e abstrações desnecessárias. | Antes de finalizar qualquer módulo e antes de adicionar qualquer dependência. |



> ⚠️ \*\*Equilíbrio importante:\*\* `ponytail` governa a \*\*implementação\*\* (código enxuto, poucas libs, sem abstração prematura), \*\*não\*\* a \*\*ambição de design\*\*. A página deve ser ousada visualmente \*e\* simples por dentro. Quando `ponytail` e ambição conflitarem, busque o efeito visual com o menor código robusto possível — não corte o efeito, corte o excesso de engenharia.



\---



\## 5. Arquitetura de agentes (via `harness`)



Peça ao \*\*`harness`\*\* para projetar e instanciar o time abaixo (ajuste nomes/skills ao que o harness gerar). Mantenha o time \*\*enxuto e com função clara\*\* — sem agente decorativo (`ponytail` vale aqui também).



```

&#x20;                        ┌─────────────────────┐

&#x20;                        │   MAESTRO / ORQUEST. │  (harness)

&#x20;                        └──────────┬──────────┘

&#x20;                                   │ planeja, despacha, integra

&#x20;       ┌───────────────┬───────────┼───────────────┬───────────────┐

&#x20;       ▼               ▼           ▼               ▼               ▼

&#x20; ┌───────────┐  ┌────────────┐ ┌──────────┐  ┌────────────┐  ┌────────────┐

&#x20; │ CONTEÚDO  │  │ DIR. ARTE  │ │  MOTION  │  │  BUILDER   │  │ COMPLIANCE │

&#x20; │ (lê docs, │  │ (tokens,   │ │ (coreogr.│  │ (implementa│  │ (CFM/LGPD/ │

&#x20; │ copy PT-BR│  │ tipo,      │ │ de       │  │ HTML/CSS/  │  │ a11y legal)│

&#x20; │ + BRIEF)  │  │ paleta,    │ │ animação)│  │ TS + GSAP) │  │            │

&#x20; └───────────┘  │ assinatura)│ └──────────┘  └────────────┘  └────────────┘

&#x20;                └────────────┘

&#x20;       ┌───────────────────────── LOOP DE QUALIDADE ─────────────────────────┐

&#x20;       ▼                          ▼                          ▼

&#x20; ┌───────────────┐         ┌──────────────┐          ┌──────────────────┐

&#x20; │ CRÍTICO ANTI- │         │ AUDITOR A11Y │          │  TRIAGEM + FIXER │

&#x20; │ IA (design)   │ ──────► │ + PERF + SEO │ ───────► │  (corrige, e o   │

&#x20; │ (vê screenshot│         │ (Lighthouse, │          │   verificador    │

&#x20; │  e julga)     │         │  contraste)  │          │   reexecuta)     │

&#x20; └───────────────┘         └──────────────┘          └──────────────────┘

```



\*\*Responsabilidades:\*\*

\- \*\*Maestro (harness):\*\* quebra o trabalho, despacha em paralelo o que dá, integra, mantém o `BRIEF.md` e a memória como verdade.

\- \*\*Conteúdo:\*\* lê a pasta, produz `BRIEF.md` e a copy final em PT-BR (§9). Não inventa.

\- \*\*Diretor de Arte (ui-ux):\*\* entrega o \*\*plano de design\*\* (§6/§7) — tokens, tipografia, conceito de layout, e \*\*o elemento-assinatura\*\*. Passa por um portão de crítica antes do build.

\- \*\*Motion:\*\* desenha a \*\*coreografia\*\* de animação (§8) — o que entra quando, com qual curva, e o fallback de reduced-motion.

\- \*\*Builder:\*\* implementa seguindo o plano à risca.

\- \*\*Compliance:\*\* valida CFM + LGPD + acessibilidade (§9/§10) — pode \*\*bloquear\*\* o release.

\- \*\*Crítico Anti-IA:\*\* olha screenshots e responde com honestidade: "isso parece template de IA?" Se sim, aponta o quê e manda revisar. Usa o checklist do §13.

\- \*\*Auditor A11y/Perf/SEO:\*\* roda Lighthouse, checa contraste, foco, semântica, metas, structured data, orçamento de performance.

\- \*\*Triagem + Fixer/Verificador:\*\* agrupa achados por severidade, corrige, e \*\*reexecuta\*\* os auditores até passar.



\---



\## 6. Direção de arte — fugir da "cara de IA"



Trate isto como o briefing de um estúdio cujo cliente \*\*já rejeitou\*\* propostas com cara de template. Cada escolha precisa ser específica para \*\*este\*\* médico e \*\*esta\*\* especialidade.



\### Princípios

\- \*\*O herói é uma tese.\*\* Abra com a coisa mais característica do mundo desse médico (uma frase, uma imagem, um gesto, um momento interativo) — não com o herói padrão "headline + número grande + gradiente". Decida o herói pelo que o brief revela.

\- \*\*A tipografia carrega a personalidade.\*\* Pareie display + corpo de forma deliberada; o tratamento de tipo é parte memorável da página, não um entregador neutro de texto. \*\*Não\*\* use Inter como default. Limite a 2–3 famílias.

\- \*\*Estrutura é informação.\*\* Eyebrows, numeração, divisores, labels só existem se codificarem algo verdadeiro. Marcadores `01/02/03` \*\*só\*\* se houver de fato uma sequência (uma jornada de atendimento real, p.ex.). Caso contrário, corte.

\- \*\*Movimento deliberado.\*\* Um momento orquestrado vale mais que efeitos espalhados (§8). Às vezes menos é mais.

\- \*\*Ambição combina com execução.\*\* Direção minimalista exige precisão milimétrica em espaçamento e tipo; direção rica exige execução elaborada. Elegância = executar bem a visão escolhida.

\- \*\*Gaste a ousadia num lugar só.\*\* Um \*\*elemento-assinatura\*\* memorável; tudo ao redor, quieto e disciplinado. Antes de finalizar, "tire um acessório" (corte o que não serve ao brief).



\### Layout — sair da grade de cards

A maior tela de "IA" é tudo virar card numa grade 3×N. Em vez disso, varie o \*\*ritmo\*\* das seções:

\- Assimetria proposital; sobreposição de elementos; full-bleed alternando com colunas estreitas; âncoras tipográficas grandes; respiro generoso onde importa.

\- Cada seção com um \*\*layout distinto\*\* — diferente densidade, alinhamento e proporção. Nada de repetir o mesmo molde.

\- Use cards \*\*só\*\* quando a informação for genuinamente uma coleção comparável (e ainda assim, com tratamento próprio, não o card padrão com sombra suave e raio de 12px).



Dois esboços de \*\*inspiração\*\* (derive os seus a partir do brief — não copie):



```

A) HERÓI EDITORIAL ASSIMÉTRICO

┌──────────────────────────────────────────────────┐

│  Dr(a). Nome              \[marca/CRM em mono]      │

│                                                    │

│   uma frase-tese grande,        ┌───────────────┐ │

│   quebrada em 2–3 linhas,       │   FOTO        │ │

│   com uma palavra em azul       │   full-bleed  │ │

│   ───────────────────           │   à direita,  │ │

│   subtítulo curto, humano       │   sangrando   │ │

│   \[▸ marcar consulta]           │   pra borda   │ │

│                                 └───────────────┘ │

└──────────────────────────────────────────────────┘



B) SEÇÃO "ABORDAGEM" EM FAIXA, NÃO EM CARDS

┌──────────────────────────────────────────────────┐

│ 01  título da etapa  ── linha fina ──  texto curto │

│ 02  título da etapa  ── linha fina ──  texto curto │  (só se for sequência real)

│ 03  título da etapa  ── linha fina ──  texto curto │

└──────────────────────────────────────────────────┘

```



\### ⚠️ Aviso de calibração (leia com atenção)

A IA hoje converge em 3 caras: \*\*(1)\*\* fundo creme quente + serifa de alto contraste + acento terracota; \*\*(2)\*\* fundo quase-preto + um acento verde-ácido/vermelhão; \*\*(3)\*\* layout de jornal com fios capilares, raio zero e colunas densas.



Este brief pede um fundo \*\*creme quente\*\* (vindo da referência Mio Spa) — perigosamente perto da cara (1). \*\*Diferencie de propósito:\*\*

\- O acento é \*\*azul quente\*\*, \*\*nunca\*\* terracota (§7).

\- A tipografia \*\*não\*\* pode ser "a serifa de alto contraste óbvia". Escolha faces que combinem com a especialidade e o tom humano do médico.

\- Entregue um \*\*elemento-assinatura real\*\* (algo do mundo da medicina/cuidado, não decoração genérica).



\### Elemento-assinatura (escolha/invente 1)

Ideias para explorar — o `ui-ux` decide a melhor para o brief:

\- Um \*\*traço/linha viva\*\* que conduz o olho pela página como uma "linha de cuidado" (responde ao scroll, conecta seções).

\- Tratamento tipográfico próprio do nome/tese (ligaduras, sublinhado desenhado à mão em azul, peso variável animado).

\- Uma \*\*paleta de gestos\*\* sutis ligados à especialidade (sem clichê de estetoscópio/coração batendo).

\- Revelação fotográfica orquestrada no herói (máscara, recorte, parallax contido).



\---



\## 7. Paleta de cores — "azul quente" derivado do Mio Spa



A referência (miospa.com.br) é creme quente + sálvia dessaturada (`#88977F`) + carvão morno. \*\*Substitua o verde por azul quente\*\* e mantenha os neutros quentes.



\*\*Regra de temperatura (crítica):\*\* o azul deve \*\*puxar para índigo/periwinkle\*\* — quente, levemente arroxeado, profundo. \*\*Nunca\*\* ciano, teal ou água. Se parecer "azul de hospital" ou "azul frio de tech", está errado.



Tokens iniciais (o `ui-ux` pode afinar os valores \*\*dentro\*\* da regra de temperatura e do contraste WCAG):



```css

:root {

&#x20; /\* Neutros quentes (base Mio Spa) \*/

&#x20; --ink:        #1A2230;  /\* quase-preto, carvão azul-morno: texto, seções escuras \*/

&#x20; --paper:      #F2ECE2;  /\* marfim quente: fundo principal \*/

&#x20; --sand:       #E6DAC8;  /\* neutro quente mais fechado: faixas/superfícies alternadas \*/



&#x20; /\* Azul quente (substitui a sálvia) \*/

&#x20; --azul-700:   #2A4068;  /\* profundo: seções escuras, texto-acento forte \*/

&#x20; --azul-500:   #3C5A88;  /\* PRIMÁRIO \*/

&#x20; --azul-300:   #8AA2C4;  /\* suave: secundário, washes \*/

&#x20; --azul-100:   #DFE7F1;  /\* wash: fundos sutis \*/



&#x20; /\* Acento quente (calor "spa"), uso MÍNIMO — só fios e assinatura \*/

&#x20; --brasa:      #C39A5B;  /\* latão/ocre morno; NÃO é terracota; parcimônia total \*/

}

```



\- \*\*Contraste:\*\* texto em `--ink` sobre `--paper`/`--sand`; CTAs e estados de foco com contraste AA+ garantido. Texto sobre azul escuro = `--paper`.

\- O `--brasa` existe \*\*só\*\* para dar o calor e marcar a assinatura (um fio, um detalhe). Se em dúvida, \*\*não use\*\* — disciplina antes de adorno.

\- Defina também tokens semânticos se houver formulário: `--ok`, `--erro`, `--foco` (anel de foco visível e bonito).



\---



\## 8. Movimento e animação



Animação a serviço do conteúdo — orquestrada, não espalhada.



\- \*\*Sequência de carregamento (1 momento forte):\*\* o herói entra coreografado (tese revela linha a linha, foto desmascara, assinatura "acende"). Curto, decidido, sem prender o usuário.

\- \*\*Scroll-triggered:\*\* revelações no viewport (ScrollTrigger/IntersectionObserver). Sutis e variadas por seção; nada de "tudo faz fade-up igual".

\- \*\*Micro-interações:\*\* hover/foco em links e CTA com intenção (a assinatura pode reagir). Estados de foco também animam.

\- \*\*Ambiente:\*\* opcional e contido (parallax leve, linha viva que segue o scroll). Se não somar, corte.



\*\*Disciplina técnica:\*\*

\- Anime só `transform` e `opacity`; `will-change` com parcimônia; cuidado com layout thrashing.

\- `prefers-reduced-motion: reduce` → desliga parallax e grandes movimentos, mantém apenas transições essenciais (a página tem que ficar ótima e legível parada).

\- Nada de animação que atrase o LCP ou bloqueie interação.



\---



\## 9. Conteúdo, copy e conformidade (CFM + LGPD)



\### Copy (Conteúdo + ui-ux)

\- Tudo em \*\*PT-BR\*\*, voz ativa, frases curtas, sentence case. Específico vence esperto.

\- A copy nasce do brief, não de clichê. Evite "sua saúde em primeiro lugar", "excelência em atendimento" e afins.

\- Estados vazios/erros do formulário falam na voz da interface, explicam o que fazer; não pedem desculpas vagas.



\### Conformidade médica — \*\*CFM\*\* (Brasil) — \*guardrails, não aconselhamento jurídico\*

O agente \*\*Compliance\*\* valida e pode bloquear. Diretrizes gerais da publicidade médica brasileira:

\- \*\*Exibir nome + CRM\*\* (e \*\*RQE\*\* quando especialista) de forma visível.

\- \*\*Proibido\*\* prometer/garantir resultados, "cura", ou usar superlativos ("melhor", "único", "número 1").

\- \*\*Sem "antes e depois"\*\* sensacionalista nem imagens que aliciem pacientes.

\- \*\*Depoimentos de pacientes\*\*: tratar com extremo cuidado; não usar depoimentos que prometam resultado. Na dúvida, não usar.

\- Sem autopromoção sensacionalista de equipamentos/técnicas; tom \*\*informativo\*\*, não comercial-agressivo.

\- Se o brief trouxer algo nessa zona, \*\*sinalizar\*\* e propor versão conforme — não publicar como veio.

\- Recomende ao cliente validação final com assessoria/CFM. Registre isso em `BRIEF.md`.



\### LGPD (se houver formulário/contato)

\- Mínimo de dados necessários; \*\*aviso de privacidade\*\* + consentimento explícito; link para política de privacidade.

\- Não logar dados sensíveis no client; não enviar a terceiros sem base legal.

\- WhatsApp/telefone como contato direto são ok; formulário exige a camada de consentimento.



\---



\## 10. Qualidade: acessibilidade, performance, responsividade, SEO



Piso obrigatório (Auditor + Compliance verificam):

\- \*\*Acessibilidade:\*\* HTML semântico, hierarquia de headings correta, `alt` significativo, foco de teclado visível e ordem lógica, contraste AA+, `prefers-reduced-motion`, navegável sem mouse. Mire 100 no Lighthouse A11y.

\- \*\*Performance:\*\* orçamento — LCP < 2,5s, CLS < 0,1, JS inicial enxuto. Imagens responsivas (`srcset`/AVIF/WebP), lazy onde fizer sentido, fontes com `font-display: swap` e preload do essencial. Lighthouse Perf ≥ 90 (mobile).

\- \*\*Responsivo:\*\* desenhe mobile-first de verdade; nada de layout que só funciona no desktop. Teste em larguras estreitas.

\- \*\*SEO:\*\* `<title>` e meta description vindos do brief, Open Graph/Twitter, favicon, `lang="pt-BR"`, \*\*JSON-LD `schema.org/Physician`\*\* (nome, especialidade, endereço, contato, CRM quando aplicável), URLs/âncoras limpas.



\---



\## 11. Processo de trabalho (dois passos + crítica)



1\. \*\*Descoberta\*\* (§1): ler pasta → `BRIEF.md` → registrar pendências.

2\. \*\*Plano de design\*\* (ui-ux): sistema de tokens (paleta nomeada §7, tipografia, layout em prosa + wireframe ASCII, \*\*assinatura\*\*). \*\*Portão de crítica:\*\* revisar o plano contra o brief — qualquer parte que pareça o default genérico (rode mentalmente "um prompt parecido chegaria aqui?") é \*\*revisada\*\*, dizendo o que mudou e por quê. Só depois, codar.

3\. \*\*Coreografia de motion\*\* (§8) definida no papel antes de implementar.

4\. \*\*Build\*\* (Builder): implementar o plano à risca. Cuidado com especificidade de CSS (seletores por classe vs. por elemento se cancelando em paddings/margins entre seções).

5\. \*\*Crítica visual:\*\* tirar \*\*screenshots\*\* (desktop + mobile) e julgar com o Crítico Anti-IA (§13). Imagem vale mais que mil tokens.

6\. \*\*Auditoria:\*\* A11y + Perf + SEO + Compliance.

7\. \*\*Loop Triagem → Fixer → Verificador\*\* até passar tudo.

8\. \*\*`ponytail` final:\*\* remover dependência/abstração/efeito que não se paga.

9\. \*\*`mem`:\*\* registrar decisões e o que foi tentado a cada passo.



\---



\## 12. Definition of Done



\- \[ ] Todo conteúdo vem dos documentos; pendências listadas em `BRIEF.md` (nada fictício "disfarçado de real").

\- \[ ] Identidade visual distinta, com \*\*elemento-assinatura\*\* claro; \*\*não\*\* cai em nenhuma das 3 caras de IA (§6).

\- \[ ] Paleta = azul quente (índigo/periwinkle) + neutros quentes do Mio Spa; \*\*sem\*\* ciano/teal e \*\*sem\*\* terracota.

\- \[ ] Tipografia deliberada (não-Inter por default), 2–3 famílias.

\- \[ ] Animação orquestrada, com fallback `reduced-motion` impecável.

\- \[ ] Sem grade de cards genérica; cada seção com ritmo próprio.

\- \[ ] Responsivo mobile→desktop; foco de teclado visível; contraste AA+.

\- \[ ] Lighthouse: Perf ≥ 90 (mobile), A11y 100, Best Practices/SEO altos.

\- \[ ] CFM: CRM/RQE visíveis, sem promessas/superlativos/antes-e-depois; itens de risco sinalizados.

\- \[ ] LGPD: consentimento + aviso de privacidade se houver formulário.

\- \[ ] JSON-LD `Physician`, metas e OG completos.

\- \[ ] `CLAUDE.md` atualizado; build estático rodando (`build`/`preview`).

\- \[ ] `ponytail` passou: zero dependência/abstração supérflua.



\---



\## 13. Checklist do Crítico Anti-IA (rode contra os screenshots)



Se \*\*qualquer\*\* item abaixo estiver presente, revisar antes de seguir:

\- \[ ] Herói é "headline + número gigante + gradiente"? → trocar pela tese do §6.

\- \[ ] Tudo virou card em grade 3×N com sombra suave e raio de 12px? → variar ritmo (§6).

\- \[ ] Fonte é Inter/Roboto/“a serifa óbvia” sem motivo? → tipografia deliberada.

\- \[ ] Acento terracota, verde-ácido ou fundo preto com 1 cor neon? → seguir paleta §7.

\- \[ ] Marcadores 01/02/03 sem sequência real? → remover.

\- \[ ] Toda revelação é o mesmo "fade-up"? → coreografia variada (§8).

\- \[ ] Copy genérica de clínica ("excelência", "sua saúde em primeiro lugar")? → reescrever do brief.

\- \[ ] Espaçamento "morno", sem grid intencional? → precisão de espaçamento.

\- \[ ] Falta o elemento-assinatura? → ele é obrigatório.

\- \[ ] Página parada (reduced-motion) fica feia ou quebrada? → tem que ficar ótima parada.



\---



\## 14. Estrutura de arquivos sugerida



```

/

├─ PROMPT.md                ← este arquivo

├─ CLAUDE.md                ← contexto do projeto (gerado/atualizado via ecc)

├─ BRIEF.md                 ← consolidação dos docs + pendências (gerado na descoberta)

├─ <documentos do cliente>  ← fonte da verdade (já presentes)

├─ index.html

├─ src/

│  ├─ styles/  (tokens.css, base.css, sections/\*.css)

│  ├─ scripts/ (main.ts, motion.ts, lenis.ts)

│  └─ assets/  (imagens otimizadas, fontes auto-hospedadas)

├─ public/ (favicon, og-image, robots, etc.)

└─ package.json

```



\---



\## 15. Primeiras ações (faça nesta ordem)



1\. Ler \*\*todos\*\* os documentos da pasta; gerar `BRIEF.md` com pendências.

2\. `ecc`: criar/atualizar `CLAUDE.md`; `mem`: abrir registro de decisões.

3\. `harness`: projetar e instanciar o time de agentes (§5).

4\. `ui-ux`: produzir o plano de design + assinatura; passar pelo \*\*portão de crítica\*\*.

5\. Definir a coreografia de motion no papel.

6\. Construir → screenshot → crítica → auditoria → loop de fix.

7\. `ponytail` final + Definition of Done.

8\. subir a pagina no GitHub e gerar uma url para acesso



> Mostre ao usuário só quando tiver confiança de que vai encantar. Trabalhe a iteração no raciocínio e na memória.

