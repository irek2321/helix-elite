#!/usr/bin/env bash
set -e

PROJECT="helix-elite"
ZIP="helix-elite-ready.zip"

rm -rf "$PROJECT" "$ZIP"
mkdir -p "$PROJECT/app" "$PROJECT/components" "$PROJECT/public"

cat > "$PROJECT/package.json" <<'EOF'
{
  "name": "helix-elite",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "14.2.5",
    "react": "18.3.1",
    "react-dom": "18.3.1",
    "framer-motion": "^11.3.30",
    "lucide-react": "^0.468.0"
  },
  "devDependencies": {
    "autoprefixer": "^10.4.20",
    "eslint": "^8.57.0",
    "eslint-config-next": "14.2.5",
    "postcss": "^8.4.41",
    "tailwindcss": "^3.4.10"
  }
}
EOF

cat > "$PROJECT/next.config.js" <<'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {}
module.exports = nextConfig
EOF

cat > "$PROJECT/postcss.config.js" <<'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

cat > "$PROJECT/tailwind.config.js" <<'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/**/*.{js,jsx}',
    './components/**/*.{js,jsx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

cat > "$PROJECT/app/globals.css" <<'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
  background: #0a0a0a;
}

::selection {
  background: rgba(255,255,255,0.18);
}
EOF

cat > "$PROJECT/app/layout.jsx" <<'EOF'
import './globals.css'

export const metadata = {
  title: 'Fenix Elite | Lifestyle coaching i analiza nawyków',
  description:
    'Premium program online wspierający analizę nawyków, plan działania, monitoring postępów i trwałą zmianę stylu życia.',
  metadataBase: new URL('https://fenix-elite.com'),
  openGraph: {
    title: 'Fenix Elite',
    description: 'Analiza nawyków. Plan działania. Monitoring postępów.',
    url: 'https://fenix-elite.com',
    siteName: 'Fenix Elite',
    type: 'website',
  },
}

export default function RootLayout({ children }) {
  return (
    <html lang="pl">
      <body>{children}</body>
    </html>
  )
}
EOF

cat > "$PROJECT/app/page.jsx" <<'EOF'
import { ShieldCheck, Activity, ClipboardCheck, ArrowRight } from 'lucide-react'

const pillars = [
  {
    title: 'Analiza nawyków',
    text: 'Zaczynamy od sprawdzenia codziennych zachowań, rytmu dnia i miejsc, w których tracisz regularność.',
  },
  {
    title: 'Plan działania',
    text: 'Tworzymy prosty system oparty o Twój czas, możliwości i realne warunki życia.',
  },
  {
    title: 'Monitoring postępów',
    text: 'Sprawdzamy wykonanie, reagujemy na problemy i aktualizujemy plan bez presji oraz pustych obietnic.',
  },
]

const process = [
  'Formularz startowy i rozmowa wprowadzająca',
  'Analiza stylu życia, regularności i przeszkód',
  'Indywidualny plan działań na najbliższy etap',
  'Monitoring postępów i korekty procesu',
]

const notDoing = [
  'Nie diagnozujemy chorób',
  'Nie leczymy i nie zastępujemy lekarza',
  'Nie gwarantujemy konkretnych efektów',
  'Nie sprzedajemy suplementów',
]

export default function Page() {
  return (
    <main className="min-h-screen bg-neutral-950 text-white font-sans overflow-hidden">
      <section className="relative min-h-screen flex items-center px-6 py-20">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_right,rgba(255,255,255,0.10),transparent_36%)]" />
        <div className="absolute inset-0 bg-[linear-gradient(to_bottom,transparent,rgba(0,0,0,0.35))]" />

        <div className="relative z-10 max-w-6xl mx-auto w-full grid lg:grid-cols-[1.1fr_0.9fr] gap-16 items-center">
          <div>
            <p className="uppercase tracking-[0.45em] text-xs text-neutral-500 mb-8">
              Discipline • Habits • System
            </p>

            <h1 className="text-6xl md:text-8xl font-black leading-[0.9] tracking-tight mb-8">
              FENIX
              <br />
              <span className="text-neutral-400">ELITE</span>
            </h1>

            <p className="text-xl md:text-2xl text-neutral-300 leading-relaxed max-w-2xl mb-10">
              Program online dla osób, które chcą uporządkować odżywianie,
              aktywność i codzienną dyscyplinę. Bez pustej motywacji. Bez
              kopiowania planów z internetu.
            </p>

            <div className="flex flex-col sm:flex-row gap-4">
              <a
                href="mailto:kontakt@fenix-elite.com?subject=Rozmowa%20wprowadzaj%C4%85ca%20Fenix%20Elite"
                className="inline-flex items-center justify-center gap-2 rounded-full bg-white px-7 py-4 text-sm font-bold text-black transition hover:bg-neutral-200"
              >
                Umów rozmowę <ArrowRight size={16} />
              </a>
              <a
                href="#proces"
                className="inline-flex justify-center rounded-full border border-white/15 px-7 py-4 text-sm font-bold text-white transition hover:bg-white/10"
              >
                Zobacz proces
              </a>
            </div>
          </div>

          <div className="rounded-[2rem] border border-white/10 bg-white/[0.03] backdrop-blur p-8 md:p-10 shadow-2xl shadow-black/30">
            <h2 className="text-2xl font-bold mb-6">Start programu</h2>
            <div className="space-y-5">
              {process.slice(0, 3).map((step, index) => (
                <div key={step} className="flex gap-4 items-start">
                  <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-white text-sm font-black text-black">
                    {index + 1}
                  </span>
                  <p className="text-neutral-300 leading-relaxed">{step}</p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      <section className="border-y border-white/10 px-6 py-20 bg-white/[0.02]">
        <div className="max-w-6xl mx-auto grid md:grid-cols-3 gap-6">
          {pillars.map((item) => (
            <article key={item.title} className="rounded-[2rem] border border-white/10 bg-white/[0.03] p-7 hover:bg-white/[0.05] transition">
              <h3 className="text-xl font-bold mb-4">{item.title}</h3>
              <p className="text-neutral-400 leading-relaxed">{item.text}</p>
            </article>
          ))}
        </div>
      </section>

      <section id="proces" className="px-6 py-24">
        <div className="max-w-6xl mx-auto grid lg:grid-cols-2 gap-12 items-start">
          <div>
            <p className="uppercase tracking-[0.45em] text-xs text-neutral-500 mb-6">Proces</p>
            <h2 className="text-4xl md:text-6xl font-black tracking-tight mb-6 leading-tight">
              System zamiast kolejnego startu od zera.
            </h2>
            <p className="text-lg text-neutral-300 leading-relaxed">
              Fenix Elite pomaga zamienić chaos w uporządkowany proces: analiza,
              plan, działanie i regularna korekta. Pracujemy na codziennych
              zachowaniach, nie na chwilowej motywacji.
            </p>
          </div>
          <div className="space-y-4">
            {process.map((step, index) => (
              <div key={step} className="rounded-3xl border border-white/10 bg-white/[0.03] p-6 flex gap-4">
                <ClipboardCheck className="text-neutral-400 shrink-0" />
                <div>
                  <p className="text-sm text-neutral-500 mb-1">Etap {index + 1}</p>
                  <p className="font-semibold text-neutral-100">{step}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="px-6 py-24 border-y border-white/10 bg-white/[0.02]">
        <div className="max-w-6xl mx-auto grid lg:grid-cols-2 gap-10">
          <div className="rounded-[2rem] border border-white/10 bg-neutral-950 p-8">
            <ShieldCheck className="mb-6 text-neutral-400" />
            <h2 className="text-3xl font-black mb-4">To nie jest usługa medyczna</h2>
            <p className="text-neutral-400 leading-relaxed">
              Program ma charakter edukacyjny i lifestyle coachingowy. Nie
              diagnozujemy chorób, nie leczymy i nie zastępujemy konsultacji z
              lekarzem, dietetykiem klinicznym, psychologiem ani fizjoterapeutą.
            </p>
          </div>
          <div className="rounded-[2rem] border border-white/10 bg-neutral-950 p-8">
            <Activity className="mb-6 text-neutral-400" />
            <h2 className="text-3xl font-black mb-4">Nie sprzedajemy suplementów</h2>
            <p className="text-neutral-400 leading-relaxed">
              Pracujemy na organizacji dnia, regularności, aktywności i
              odżywianiu. Nie opieramy procesu na cudownych metodach ani
              produktach koniecznych do efektu.
            </p>
          </div>
        </div>
      </section>

      <section className="px-6 py-24">
        <div className="max-w-5xl mx-auto text-center">
          <p className="uppercase tracking-[0.45em] text-xs text-neutral-500 mb-6">Czego nie robimy</p>
          <h2 className="text-4xl md:text-6xl font-black tracking-tight mb-10 leading-tight">
            Jasne zasady. Bez fałszywych obietnic.
          </h2>
          <div className="grid md:grid-cols-2 gap-4 text-left">
            {notDoing.map((item) => (
              <div key={item} className="rounded-3xl border border-white/10 bg-white/[0.03] p-6 text-neutral-300">
                {item}
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="px-6 py-24 border-t border-white/10 bg-white/[0.02]">
        <div className="max-w-4xl mx-auto text-center">
          <p className="uppercase tracking-[0.45em] text-xs text-neutral-500 mb-6">Start</p>
          <h2 className="text-4xl md:text-6xl font-black tracking-tight mb-8 leading-tight">
            Zacznij od krótkiej rozmowy wprowadzającej.
          </h2>
          <p className="text-lg md:text-xl text-neutral-300 leading-relaxed mb-10">
            Opisz swój cel, największy problem z regularnością i dostępny czas.
            Na tej podstawie ustalimy, czy program pasuje do Twojej sytuacji.
          </p>
          <a
            href="mailto:kontakt@fenix-elite.com?subject=Chc%C4%99%20rozpocz%C4%85%C4%87%20Fenix%20Elite&body=Dzie%C5%84%20dobry%2C%0A%0AChc%C4%99%20um%C3%B3wi%C4%87%20rozmow%C4%99%20wprowadzaj%C4%85c%C4%85%20do%20programu%20Fenix%20Elite.%0A%0APozdrawiam%2C"
            className="inline-flex items-center justify-center gap-2 rounded-full bg-white px-8 py-4 text-sm font-bold text-black transition hover:bg-neutral-200"
          >
            Napisz do nas <ArrowRight size={16} />
          </a>
        </div>
      </section>

      <footer className="border-t border-white/10 px-6 py-8">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row gap-4 md:items-center md:justify-between text-sm text-neutral-500">
          <p>© 2026 Fenix Elite</p>
          <div className="flex flex-wrap gap-5">
            <a href="mailto:kontakt@fenix-elite.com" className="hover:text-white transition">kontakt@fenix-elite.com</a>
            <a href="#" className="hover:text-white transition">Regulamin</a>
            <a href="#" className="hover:text-white transition">Polityka prywatności</a>
          </div>
        </div>
      </footer>
    </main>
  )
}
EOF

cat > "$PROJECT/.gitignore" <<'EOF'
node_modules
.next
out
.env*.local
.vercel
.DS_Store
EOF

cat > "$PROJECT/README.md" <<'EOF'
# Fenix Elite

Gotowa strona landing page pod Vercel.

## Lokalnie

```bash
npm install
npm run dev
```

## Deploy

Wrzuć cały folder do GitHub i połącz repozytorium z Vercel.
EOF

zip -r "$ZIP" "$PROJECT"
echo "Gotowe: $ZIP"
