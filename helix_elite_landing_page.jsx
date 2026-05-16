export default function FENIXEliteLanding() {
  const pillars = [
    {
      title: 'Trening',
      text: 'Plan dopasowany do poziomu, czasu i realnych możliwości.',
    },
    {
      title: 'Odżywianie',
      text: 'Regularność, kontrola posiłków i proste zasady do utrzymania.',
    },
    {
      title: 'Dyscyplina',
      text: 'Monitoring działań, przypomnienia i odpowiedzialność za wykonanie.',
    },
  ]

  const steps = [
    'Krótka rozmowa wprowadzająca',
    'Analiza nawyków i problemów',
    'Indywidualny program działania',
  ]

  return (
    <main className="min-h-screen bg-neutral-950 text-white font-sans">
      <section className="min-h-screen flex items-center px-6 py-20">
        <div className="max-w-6xl mx-auto w-full grid lg:grid-cols-[1.1fr_0.9fr] gap-16 items-center">
          <div>
            <p className="uppercase tracking-[0.45em] text-xs text-neutral-500 mb-8">
              Discipline • Body • Mind
            </p>

            <h1 className="text-6xl md:text-8xl font-black leading-[0.9] tracking-tight mb-8">
 
              FENIX
              <br />
              <span className="text-neutral-400">ELITE</span>
            </h1>

            <p className="text-xl md:text-2xl text-neutral-300 leading-relaxed max-w-2xl mb-10">
              Program online dla osób, które chcą zbudować trening, odżywianie
              i dyscyplinę w realnym życiu. Bez pustej motywacji. Bez kopiowania
              planów z internetu.
            </p>

            <div className="flex flex-col sm:flex-row gap-4">
              <a
                href="mailto:hello@FENIX-elite.com?subject=Rozmowa%20wprowadzaj%C4%85ca%20FENIX%20Elite"
                className="inline-flex justify-center rounded-full bg-white px-7 py-4 text-sm font-bold text-black transition hover:bg-neutral-200"
              >
                Umów rozmowę
              </a>

       
            </div>
          </div>

          <div className="rounded-[2rem] border border-white/10 bg-white/[0.03] p-8 md:p-10">
            <h2 className="text-2xl font-bold mb-6">Start programu</h2>
            <div className="space-y-5">
              {steps.map((step, index) => (
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

      <section className="border-y border-white/10 px-6 py-20">
        <div className="max-w-6xl mx-auto grid md:grid-cols-3 gap-6">
          {pillars.map((item) => (
            <article
              key={item.title}
              className="rounded-[2rem] border border-white/10 bg-white/[0.03] p-7"
            >
              <h3 className="text-xl font-bold mb-4">{item.title}</h3>
              <p className="text-neutral-400 leading-relaxed">{item.text}</p>
            </article>
          ))}
        </div>
      </section>

      <section className="px-6 py-24">
        <div className="max-w-4xl mx-auto text-center">
          <p className="uppercase tracking-[0.45em] text-xs text-neutral-500 mb-6">
            Dla kogo
          </p>

          <h2 className="text-4xl md:text-6xl font-black tracking-tight mb-8">
            Dla ludzi, którzy chcą przestać zaczynać od nowa.
          </h2>

          <p className="text-lg md:text-xl text-neutral-300 leading-relaxed mb-10">
            Jeśli pomijasz posiłki, tracisz regularność, odkładasz trening albo
            działasz tylko wtedy, gdy masz motywację, FENIX Elite zamienia chaos
            w prosty system codziennych działań.
          </p>

          <a
            href="mailto:hello@FENIX-elite.com?subject=Chc%C4%99%20rozpocz%C4%85%C4%87%20FENIX%20Elite&body=Dzie%C5%84%20dobry%2C%0A%0AChc%C4%99%20um%C3%B3wi%C4%87%20rozmow%C4%99%20wprowadzaj%C4%85c%C4%85%20do%20programu%20FENIX%20Elite.%0A%0APozdrawiam%2C"
            className="inline-flex rounded-full bg-white px-8 py-4 text-sm font-bold text-black transition hover:bg-neutral-200"
          >
            Napisz do nas
          </a>
        </div>
      </section>

      <footer className="border-t border-white/10 px-6 py-8">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row gap-4 md:items-center md:justify-between text-sm text-neutral-500">
          <p>© 2026 FENIX Elite</p>
          <div className="flex flex-wrap gap-5">
            <a href="mailto:hello@FENIX-elite.com" className="hover:text-white transition">
              hello@FENIX-elite.com
            </a>
            <a href="#" className="hover:text-white transition">
              Regulamin
            </a>
            <a href="#" className="hover:text-white transition">
              Polityka prywatności
            </a>
          </div>
        </div>
      </footer>
    </main>
  )
}
