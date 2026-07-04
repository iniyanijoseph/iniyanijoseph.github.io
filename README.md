# iniyanijoseph.github.io

Personal academic website and blog, written in [Typst](https://typst.app) and compiled to static HTML. Inspired by [tufted](https://tufted.vsheg.com/).

## What this is

- **Academic site/blog** — pages live under `blog/`, `papers/`, `projects/`, `school/`, `applications/`, each as a Typst source file.
- **Auto-generated CV** — `cv.typ` is the single source of truth for my CV. The build compiles it to both `cv.pdf` (downloadable resume) and `index.html` (site homepage), so the CV and homepage never drift out of sync.
- **Automations** — the `Makefile` handles the build: it scans for pages that use `cv.with` styling, compiles each to HTML, and regenerates the CV/PDF outputs, and also generates and sends a weekly digest (similar to Mailbrow).

## Structure

```
cv.typ          # CV source, also serves as homepage content
src/            # shared Typst templates/helpers
blog/           # blog posts
papers/         # academic writing
projects/       # project writeups
school/         # coursework
applications/   # application-related content
```

Each page lives at `<category>/<slug>/main.typ`.

## Build

Requires [Typst](https://typst.app) with HTML export enabled.

```sh
make          # trace pages, build cv.pdf, index.html, and all site pages
make cv       # rebuild just the CV (PDF + homepage)
make html     # rebuild just the site pages
make clean    # remove build outputs
```

## License

MIT — see [LICENSE](LICENSE).
