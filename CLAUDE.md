# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

UHHthesis is a **Quarto template extension** providing thesis templates for Bachelor and Master theses at the University of Hamburg (UHH). It offers two language variants (English and German), each producing both PDF and DOCX output from a single set of source files.

The GitHub repository lives under the **uham-bio** organization.

## Repository Structure

```
quarto-UHHthesis/
├── en/                          # English template
│   ├── _quarto.yml              # Book project config + thesis metadata
│   ├── index.qmd                # Entry point (includes prelim, LoF/LoT)
│   ├── _extensions/UHHthesis/   # Format extension
│   │   ├── _extension.yml       # Defines UHHthesis-pdf and UHHthesis-docx
│   │   ├── template.tex         # Pandoc LaTeX template
│   │   └── uhh-template.docx    # Word reference document
│   ├── prelim/                  # 00-abstract, 00-zusammenfassung, 00-abbreviations
│   ├── chapter/                 # 01-intro through 99-declaration
│   ├── bib/                     # Bibliography (.bib) and citation style (.csl)
│   ├── data/                    # Sample data
│   └── images/                  # UHH logos and sample figures
├── de/                          # German template (same structure, German content)
│   └── ...
├── README.md
├── CLAUDE.md
└── .gitignore
```

## Build & Verification Commands

```sh
# Render English PDF
cd en && quarto render --to UHHthesis-pdf

# Render English DOCX
cd en && quarto render --to UHHthesis-docx

# Render German PDF
cd de && quarto render --to UHHthesis-pdf

# Render German DOCX
cd de && quarto render --to UHHthesis-docx
```

There are no automated tests. Validation is done by rendering the templates and inspecting output. Output goes to `thesis-output/`.

## Architecture

### Template Extension (`_extensions/UHHthesis/`)

Each language variant contains an identical extension structure:
- `_extension.yml` — defines two contributed formats (`pdf` wrapping Quarto's `pdf` with a custom template, `docx` wrapping Quarto's `docx` with a reference document)
- `template.tex` — Pandoc LaTeX template producing the title page, TOC, and document structure
- `uhh-template.docx` — Word reference document for styling

### Rendering Pipeline

`_quarto.yml` (book config) → `quarto render` → selects `UHHthesis-pdf` or `UHHthesis-docx` → extension applies `template.tex` / `uhh-template.docx` → Pandoc + LaTeX/Word → output in `thesis-output/`

### Key Conventions

- **Quarto book project**: Each language template is a self-contained Quarto book project
- **Cross-references**: `@fig-label`, `@tbl-label`, `@eq-label` (Quarto native)
- **Code chunks**: YAML-style options with `#| key: value`
- **Conditional content**: `::: {.content-visible when-format="pdf"}` for format-specific blocks
- **Page breaks**: `{{< pagebreak >}}` shortcode
- **Unnumbered sections**: `{.unnumbered}` or `{.unnumbered .unlisted}`
- **Table packages**: kableExtra (PDF), flextable (PDF + Word)
- **Plots**: ggplot2 (preferred)

### Chapter ordering

1. 01-intro / 01-einleitung
2. 02-methods / 02-methodik
3. 03-results / 03-ergebnisse
4. 04-discussion / 04-diskussion
5. 96-references / 96-referenzen
6. 97-acknowledge / 97-danksagung (appendix)
7. 98-appendix / 98-anhang (appendix)
8. 99-declaration / 99-versicherung (appendix)

### Differences between EN and DE templates

- `template.tex`: German uses `\usepackage[ngerman]{babel}`, German labels on title page
- `_quarto.yml`: German has `crossref:` section with translated labels (Abbildung, Tabelle, etc.)
- Chapter filenames differ (e.g., `01-intro.qmd` vs `01-einleitung.qmd`)
- All instructional content is in the respective language

## Dependencies

- **Quarto >= 1.3**
- **R >= 4.0** (if using R code chunks), with knitr, kableExtra, flextable, and ggplot2
- **System**: A LaTeX distribution (e.g., TinyTeX) for PDF output

## User Installation

Users scaffold projects with:
```sh
quarto use template uham-bio/UHHthesis/en   # English
quarto use template uham-bio/UHHthesis/de   # German
```
