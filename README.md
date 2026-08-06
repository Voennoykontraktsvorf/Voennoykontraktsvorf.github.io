# voenkontrsvo — GitHub Pages LP

Одностраничный landing как SEO brand entity signal (`github.io` даёт DR ~90 в поисковых системах, полезен для внешнего linking на основной сайт).

## Что внутри

- `index.html` — 20 регионов + hero + 4-шаговый процесс + FAQ + футер с контактами
- `style.css` — design tokens (cool navy палитра), прямые формы, mobile-адаптивно
- `assets/hero.webp` — hero-фото (780 KB, WebP)

Итого: **~800 KB**, no JS, no npm, no external deps. Флаг РФ — inline SVG подложкой (opacity 0.10).

## Deploy на GitHub Pages

### Вариант 1 — новый repo (через web github.com/new)

1. Создай новый repo `voenkontrsvo-lp` (public)
2. В нём push этих файлов:
   ```bash
   cd tools/github-lp
   git init
   git add -A
   git commit -m "initial LP"
   git branch -M main
   git remote add origin https://github.com/<USERNAME>/voenkontrsvo-lp.git
   git push -u origin main
   ```
3. В Settings → Pages → Source: `main` branch / (root) → Save
4. Через 1–2 мин live на `https://<USERNAME>.github.io/voenkontrsvo-lp/`

### Вариант 2 — user site (root domain `<USERNAME>.github.io`)

Repo должен называться **`<USERNAME>.github.io`**. Всё то же, но URL будет без /repo-suffix:
- `https://<USERNAME>.github.io/`

## После deploy

1. Yandex Webmaster → «Добавить сайт» → `<USERNAME>.github.io/voenkontrsvo-lp/`
2. Google Search Console → verify meta tag или DNS
3. Обновить `<meta name="yandex-verification">` в index.html на актуальный token GitHub Pages сайта (сейчас указан token основного сайта — заменить)
4. Опционально: custom domain через Settings → Pages → Custom domain

## Обновление данных

Суммы в карточках — статические, вручную. Если изменились на PROD `/api/regions` — правь `index.html` и push.

Автоматизация (опционально): cron script который тянет `/api/regions?depth=0&limit=20` → генерирует новую версию `index.html` → git commit + push.

## SEO мета уже настроены

- `<title>` — про контракт СВО + 2026
- `<meta name="description">` — про 20+ регионов + суммы
- `<meta name="yandex-verification">` — token основного сайта (заменить на github-token)
- Open Graph — для соц-share
- `<link rel="canonical">` — указывает на основной сайт (не конкурирует за SEO)

Canon: [[feedback_no_external_lead_channels]] (только наши каналы), [[feedback_design_principles]] (прямые формы, флаг подложкой), [[feedback_cities_text_max_3_lines]] (короткий текст карточек).
