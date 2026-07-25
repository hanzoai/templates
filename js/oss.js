// Hanzo OSS explorer — reads the SAME /meta.json + /blueprints/<id>/ data the
// templates.hanzo.ai PaaS loader consumes, and renders a fast, searchable,
// keyboard-friendly gallery. Static-served (hanzoai/static): same-origin fetch,
// no framework, no external deps. CSP-safe: no inline handlers (logo fallbacks
// are attached in JS, not via an onerror= attribute).
'use strict';

// The PROVEN one-click deploy deep link: platform.hanzo.ai/templates reads
// ?deploy=<id>, matches it against this same catalog, and opens the deploy
// dialog (PaaS pages/dashboard/templates.tsx). Confirmed live (200).
var DEPLOY = 'https://platform.hanzo.ai/templates?deploy=';
var CATALOG = 'meta.json';
var LOGO_BASE = 'blueprints/';
var PAGE = 48;

// Build-provenance tags are catalog plumbing, not user-facing categories.
var HIDE = { caprover: 1, dokploy: 1, coolify: 1, casaos: 1, runtipi: 1, docker: 1, free: 1, 'open-source': 1 };
// Recognizable categories shown first (only if present in the data), then the
// most common remaining tags fill the bar — so it always reflects the real set.
var PREFERRED = ['ai', 'llm', 'database', 'automation', 'monitoring', 'analytics',
  'media', 'cms', 'productivity', 'security', 'storage', 'development', 'devtools',
  'communication', 'networking', 'finance', 'self-hosted'];
var MAX_TAGS = 16;
var LABEL = { ai: 'AI', llm: 'LLM', cms: 'CMS', api: 'API', crm: 'CRM', erp: 'ERP',
  dns: 'DNS', vpn: 'VPN', iot: 'IoT', ci: 'CI', cd: 'CD', devtools: 'Dev tools',
  's3': 'S3', 'self-hosted': 'Self-hosted' };
// Too generic to be a useful per-card badge.
var GENERIC = { 'self-hosted': 1, 'open-source': 1, docker: 1, free: 1, app: 1, web: 1, hosting: 1, utilities: 1 };

var all = [], view = [], shown = 0, active = '';

var grid = document.getElementById('grid');
var q = document.getElementById('q');
var tagsEl = document.getElementById('tags');
var moreBtn = document.getElementById('more');
var emptyEl = document.getElementById('empty');
var countEl = document.getElementById('count');
var resultEl = document.getElementById('result-count');

function label(tag) { return LABEL[tag] || (tag.charAt(0).toUpperCase() + tag.slice(1)); }

function githubUrl(t) { return (t.links && t.links.github) || ''; }

// The most specific, non-generic tag — used as the card's category badge.
function badgeTag(t) {
  var tags = t.tags || [];
  for (var i = 0; i < tags.length; i++) if (!GENERIC[tags[i]] && !HIDE[tags[i]]) return tags[i];
  for (var j = 0; j < tags.length; j++) if (!HIDE[tags[j]]) return tags[j];
  return '';
}

function monoNode(name) {
  var d = document.createElement('div');
  d.className = 'logo mono';
  d.textContent = (name || '?').charAt(0).toUpperCase();
  return d;
}

function svg(markup) {
  var span = document.createElement('span');
  span.innerHTML = markup; // static, trusted SVG markup — no event handlers
  return span.firstChild;
}

var ROCKET = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4.5 16.5 3 21l4.5-1.5"/><path d="M15 9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" opacity="0"/><path d="M9 15l-3-3c1.5-6 6-9 12-9 0 6-3 10.5-9 12z"/><path d="M9 15v4l3-3"/></svg>';

function card(t) {
  var el = document.createElement('article');
  el.className = 'card';

  // logo (image with a JS-attached fallback to a monogram — CSP-safe)
  if (t.logo) {
    var img = document.createElement('img');
    img.className = 'logo';
    img.loading = 'lazy';
    img.alt = '';
    img.src = LOGO_BASE + encodeURIComponent(t.id) + '/' + encodeURIComponent(t.logo);
    img.onerror = function () { if (img.parentNode) img.parentNode.replaceChild(monoNode(t.name || t.id), img); };
    el.appendChild(img);
  } else {
    el.appendChild(monoNode(t.name || t.id));
  }

  var body = document.createElement('div');
  body.className = 'body';

  var nameRow = document.createElement('div');
  nameRow.className = 'name-row';
  var name = document.createElement('p');
  name.className = 'name';
  name.textContent = t.name || t.id;
  nameRow.appendChild(name);
  var bt = badgeTag(t);
  if (bt) {
    var cat = document.createElement('span');
    cat.className = 'cat';
    cat.textContent = label(bt);
    nameRow.appendChild(cat);
  }
  body.appendChild(nameRow);

  var desc = document.createElement('p');
  desc.className = 'desc';
  desc.textContent = t.description || '';
  body.appendChild(desc);

  var row = document.createElement('div');
  row.className = 'row';

  var deploy = document.createElement('a');
  deploy.className = 'deploy';
  deploy.href = DEPLOY + encodeURIComponent(t.id);
  deploy.appendChild(svg(ROCKET));
  deploy.appendChild(document.createTextNode('Deploy'));
  deploy.setAttribute('aria-label', 'Deploy ' + (t.name || t.id) + ' on Hanzo');
  row.appendChild(deploy);

  var gh = githubUrl(t);
  if (gh) {
    var link = document.createElement('a');
    link.className = 'link';
    link.href = gh;
    link.target = '_blank';
    link.rel = 'noopener';
    link.textContent = 'Source';
    row.appendChild(link);
  }

  body.appendChild(row);
  el.appendChild(body);
  return el;
}

function render(reset) {
  if (reset) { grid.innerHTML = ''; shown = 0; }
  var frag = document.createDocumentFragment();
  var end = Math.min(shown + PAGE, view.length);
  for (var i = shown; i < end; i++) frag.appendChild(card(view[i]));
  grid.appendChild(frag);
  shown = end;
  moreBtn.hidden = shown >= view.length;
  emptyEl.hidden = view.length > 0;
  if (resultEl) {
    if (!all.length) { resultEl.textContent = ''; }
    else if (view.length === all.length) { resultEl.textContent = 'Showing all ' + all.length.toLocaleString() + ' apps'; }
    else { resultEl.textContent = 'Showing ' + view.length.toLocaleString() + ' of ' + all.length.toLocaleString() + ' apps'; }
  }
}

function apply() {
  var term = q.value.trim().toLowerCase();
  view = all.filter(function (t) {
    if (active && !(t.tags || []).some(function (x) { return x === active; })) return false;
    if (!term) return true;
    return (t.name || '').toLowerCase().indexOf(term) >= 0 ||
           (t.description || '').toLowerCase().indexOf(term) >= 0 ||
           (t.id || '').toLowerCase().indexOf(term) >= 0 ||
           (t.tags || []).join(' ').toLowerCase().indexOf(term) >= 0;
  });
  render(true);
  syncHash();
}

// ---- category chips (data-driven: recognizable first, then most common) ----
function chipList() {
  var freq = {};
  all.forEach(function (t) {
    (t.tags || []).forEach(function (tag) { if (!HIDE[tag]) freq[tag] = (freq[tag] || 0) + 1; });
  });
  var chosen = [], seen = {};
  PREFERRED.forEach(function (tag) { if (freq[tag] && !seen[tag]) { chosen.push(tag); seen[tag] = 1; } });
  Object.keys(freq)
    .filter(function (tag) { return !seen[tag]; })
    .sort(function (a, b) { return freq[b] - freq[a]; })
    .forEach(function (tag) { if (chosen.length < MAX_TAGS) { chosen.push(tag); seen[tag] = 1; } });
  return chosen.slice(0, MAX_TAGS);
}

function setActive(tag, btn) {
  if (active === tag) { active = ''; if (btn) btn.classList.remove('on'); btn && btn.setAttribute('aria-pressed', 'false'); }
  else {
    active = tag;
    Array.prototype.forEach.call(tagsEl.children, function (c) { c.classList.remove('on'); c.setAttribute('aria-pressed', 'false'); });
    if (btn) { btn.classList.add('on'); btn.setAttribute('aria-pressed', 'true'); }
  }
  apply();
}

function buildTags() {
  chipList().forEach(function (tag) {
    var b = document.createElement('button');
    b.className = 'tag';
    b.type = 'button';
    b.textContent = label(tag);
    b.dataset.tag = tag;
    b.setAttribute('aria-pressed', 'false');
    b.addEventListener('click', function () { setActive(tag, b); });
    tagsEl.appendChild(b);
  });
}

// ---- shareable/deep-linkable state in the URL hash ----
function syncHash() {
  var p = [];
  if (q.value.trim()) p.push('q=' + encodeURIComponent(q.value.trim()));
  if (active) p.push('tag=' + encodeURIComponent(active));
  var url = p.length ? '#' + p.join('&') : location.pathname + location.search;
  try { history.replaceState(null, '', url); } catch (e) { /* ignore */ }
}

function readHash() {
  var h = location.hash.replace(/^#/, '');
  if (!h) return;
  var params = {};
  h.split('&').forEach(function (kv) {
    var i = kv.indexOf('=');
    if (i > 0) params[decodeURIComponent(kv.slice(0, i))] = decodeURIComponent(kv.slice(i + 1));
  });
  if (params.q) q.value = params.q;
  if (params.tag) {
    active = params.tag;
    Array.prototype.forEach.call(tagsEl.children, function (c) {
      if (c.dataset.tag === active) { c.classList.add('on'); c.setAttribute('aria-pressed', 'true'); }
    });
  }
}

// ---- events ----
var timer;
q.addEventListener('input', function () { clearTimeout(timer); timer = setTimeout(apply, 80); });
moreBtn.addEventListener('click', function () { render(false); });

document.addEventListener('keydown', function (e) {
  var el = document.activeElement, typing = el && (el.tagName === 'INPUT' || el.tagName === 'TEXTAREA');
  if (e.key === '/' && !typing) { e.preventDefault(); q.focus(); q.select(); }
  else if (e.key === 'Escape') {
    if (q.value || active) {
      q.value = ''; active = '';
      Array.prototype.forEach.call(tagsEl.children, function (c) { c.classList.remove('on'); c.setAttribute('aria-pressed', 'false'); });
      apply();
    }
    if (typing) el.blur();
  }
});

// ---- load the catalog ----
fetch(CATALOG)
  .then(function (r) { if (!r.ok) throw new Error(r.status); return r.json(); })
  .then(function (data) {
    all = Array.isArray(data) ? data : [];
    if (countEl) countEl.textContent = all.length.toLocaleString();
    buildTags();
    readHash();
    apply();
  })
  .catch(function () {
    emptyEl.hidden = false;
    emptyEl.textContent = 'Catalog failed to load — open meta.json directly.';
  });
