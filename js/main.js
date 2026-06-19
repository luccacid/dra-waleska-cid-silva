// Linha de cuidado + reveals. Sem libs — IntersectionObserver nativo.
// ponytail: glue de DOM; o teste é o screenshot. Sem framework.

// 1) Mede cada traçado ECG para o desenho começar do tamanho certo.
document.querySelectorAll('.ecg path').forEach((p) => {
  const len = Math.ceil(p.getTotalLength());
  p.parentElement.style.setProperty('--len', len);
});

const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

// 2) Revela elementos e desenha as linhas ao entrar no viewport.
if (reduce || !('IntersectionObserver' in window)) {
  document.querySelectorAll('.reveal').forEach((el) => el.classList.add('is-visible'));
  document.querySelectorAll('.ecg').forEach((el) => el.classList.add('is-drawn'));
} else {
  const io = new IntersectionObserver((entries, obs) => {
    for (const e of entries) {
      if (!e.isIntersecting) continue;
      e.target.classList.add('is-visible', 'is-drawn');
      obs.unobserve(e.target);
    }
  }, { rootMargin: '0px 0px -8% 0px', threshold: 0.01 });

  document.querySelectorAll('.reveal, .ecg').forEach((el) => io.observe(el));
}
