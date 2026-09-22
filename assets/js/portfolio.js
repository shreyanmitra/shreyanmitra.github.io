(() => {
  'use strict';
  const nav = document.querySelector('[data-nav]');
  const toggle = document.querySelector('.menu-toggle');
  const menu = document.getElementById('primary-nav');
  const setMenu = (open, restoreFocus = false) => {
    if (!toggle || !menu || !nav) return;
    toggle.setAttribute('aria-expanded', String(open));
    toggle.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
    menu.classList.toggle('open', open);
    nav.classList.toggle('menu-open', open);
    if (restoreFocus) toggle.focus();
  };
  toggle?.addEventListener('click', () => setMenu(toggle.getAttribute('aria-expanded') !== 'true'));
  menu?.addEventListener('click', (event) => { if (event.target.closest('a')) setMenu(false); });
  document.addEventListener('keydown', (event) => { if (event.key === 'Escape' && toggle?.getAttribute('aria-expanded') === 'true') setMenu(false, true); });
  document.addEventListener('click', (event) => { if (nav && !nav.contains(event.target)) setMenu(false); });
  const mobile = matchMedia('(max-width: 900px)');
  mobile.addEventListener('change', () => setMenu(false));
  // Keep the menu usable if JavaScript never loads.
  document.documentElement.classList.replace('no-js', 'js');
  const onScroll = () => nav?.classList.toggle('scrolled', window.scrollY > 60 || !document.querySelector('.hero'));
  onScroll();
  window.addEventListener('scroll', onScroll, { passive: true });

  if ('IntersectionObserver' in window && !matchMedia('(prefers-reduced-motion: reduce)').matches) {
    const active = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
        menu?.querySelectorAll('[data-section]').forEach((link) => {
          const current = link.dataset.section === entry.target.id;
          link.classList.toggle('active', current);
          if (current) link.setAttribute('aria-current', 'location'); else link.removeAttribute('aria-current');
        });
      });
    }, { rootMargin: '-20% 0px -60% 0px' });
    document.querySelectorAll('.home-section').forEach((section) => active.observe(section));
  }

  document.querySelectorAll('[data-filter-group]').forEach((group) => {
    const target = document.getElementById(group.dataset.filterGroup);
    if (!target) return;
    const cards = [...target.querySelectorAll('[data-category]')];
    const status = document.getElementById(group.dataset.status);
    group.hidden = false;
    group.addEventListener('click', (event) => {
      const button = event.target.closest('button[data-filter]');
      if (!button) return;
      group.querySelectorAll('button').forEach((item) => item.setAttribute('aria-pressed', String(item === button)));
      let visible = 0;
      cards.forEach((card) => {
        card.hidden = button.dataset.filter !== 'All' && card.dataset.category !== button.dataset.filter;
        if (!card.hidden) { visible++; card.classList.add('revealed'); }
      });
      target.classList.toggle('single-result', visible === 1);
      const label = target.id === 'skill-cloud' ? 'skill' : (group.dataset.itemLabel || 'project');
      const plural = `${label}s`;
      if (status) status.textContent = `${visible} ${visible === 1 ? label : plural} shown`;
    });
    if (target.id === 'skill-cloud') {
      target.addEventListener('click', (event) => {
        const chip = event.target.closest('[data-category]');
        if (!chip) return;
        const active = group.querySelector('button[aria-pressed="true"]');
        const next = active?.dataset.filter === chip.dataset.category ? 'All' : chip.dataset.category;
        [...group.querySelectorAll('button[data-filter]')].find((item) => item.dataset.filter === next)?.click();
      });
    }
  });
})();
