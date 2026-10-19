/* Set lighting before paint; a failed preference store must not block the switch. */
(() => {
  'use strict';
  const root = document.documentElement;
  let theme = 'dark';
  try { if (localStorage.getItem('theme') === 'light') theme = 'light'; } catch { /* Private browsing. */ }
  root.dataset.theme = theme;
  let audio;
  const clickSound = () => {
    try {
      const Context = window.AudioContext || window.webkitAudioContext;
      if (!Context) return;
      audio ||= new Context();
      const play = () => {
        const length = Math.ceil(audio.sampleRate * .028);
        const buffer = audio.createBuffer(1, length, audio.sampleRate);
        const samples = buffer.getChannelData(0);
        for (let i = 0; i < length; i++) samples[i] = (Math.random() * 2 - 1) * Math.exp(-i / (length * .12));
        const source = audio.createBufferSource();
        const filter = audio.createBiquadFilter();
        const gain = audio.createGain();
        filter.type = 'bandpass'; filter.frequency.value = 1800; filter.Q.value = .7;
        gain.gain.value = .12;
        source.buffer = buffer; source.connect(filter); filter.connect(gain); gain.connect(audio.destination);
        source.onended = () => { source.disconnect(); filter.disconnect(); gain.disconnect(); };
        source.start();
      };
      if (audio.state === 'suspended') audio.resume().then(play).catch(() => {});
      else if (audio.state === 'running') play();
    } catch { /* Lighting still works when audio is unavailable. */ }
  };
  document.addEventListener('DOMContentLoaded', () => {
    const button = document.querySelector('.lighting-switch');
    if (!button) return;
    const reduced = matchMedia('(prefers-reduced-motion: reduce)');
    let bounces = [];
    const update = next => {
      root.dataset.theme = next;
      const light = next === 'light';
      button.setAttribute('aria-pressed', String(light));
      button.setAttribute('aria-label', `Pull cord to turn the lights ${light ? 'off' : 'on'}`);
      button.querySelector('.lighting-hint').textContent = `Lights ${light ? 'off' : 'on'}`;
      document.querySelector('meta[name="theme-color"]')?.setAttribute('content', light ? '#f8fafc' : '#070a12');
    };
    update(root.dataset.theme);
    button.hidden = false;
    button.addEventListener('click', () => {
      const next = root.dataset.theme === 'dark' ? 'light' : 'dark';
      update(next);
      try { localStorage.setItem('theme', next); } catch { /* Optional persistence. */ }
      clickSound();
      bounces.forEach(animation => animation.cancel());
      bounces = [];
      if (!reduced.matches && button.animate) {
        bounces.push(button.querySelector('.cord-handle').animate([
          {transform:'translateY(0)'}, {transform:'translateY(13px)',offset:.22},
          {transform:'translateY(-3px)',offset:.54}, {transform:'translateY(2px)',offset:.75},
          {transform:'translateY(0)'}
        ], {duration:420,easing:'cubic-bezier(.22,.61,.36,1)'}));
        button.querySelectorAll('.cord-thread, .cord-beads').forEach(chain => {
          bounces.push(chain.animate([
            {transform:'scaleY(1)'}, {transform:'scaleY(1.186)',offset:.22},
            {transform:'scaleY(.957)',offset:.54}, {transform:'scaleY(1.029)',offset:.75},
            {transform:'scaleY(1)'}
          ], {duration:420,easing:'cubic-bezier(.22,.61,.36,1)'}));
        });
      }
    });
    addEventListener('storage', event => {
      if (event.key === 'theme') update(event.newValue === 'light' ? 'light' : 'dark');
    });
  });
})();
