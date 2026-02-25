# quarto-UHHthesis (Quarto extension)  <img src="docs/UHHthesis_logo.png" align="right" width="100" height="100"/>

[![Author: Saskia Otto](https://img.shields.io/badge/author-Saskia%20Otto-blue)](https://github.com/saskiaotto)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)

This is a newer variant of [UHHthesis](https://github.com/uham-bio/UHHthesis) for the [Quarto](https://quarto.org/) publishing system. It provides templates for **Bachelor** and **Master** theses at the University of Hamburg (UHH) in **German** and **English**. The templates produce both **PDF** and **Word (DOCX)** output from a single set of source files.

The original [UHHthesis](https://github.com/uham-bio/UHHthesis) is an R package based on R Markdown and bookdown, primarily designed for use with R and RStudio. In contrast, quarto-UHHthesis is a Quarto extension hat can be installed directly from the terminal — no R installation required. Quarto supersedes R Markdown and is language-agnostic, with native support for R, Python, Julia, and Observable. It also works with a variety of editors and IDEs, including RStudio, Positron, VS Code, Neovim, and even Jupyter notebooks. As a Quarto extension rather than an R package, quarto-UHHthesis does not depend on R and is accessible to a broader audience.

The templates conform to the submission standards of the MIN faculty and are primarily designed for the Biology Department's "Data Science in Biology" program, but can be adapted by any UHH student. For new projects, quarto-UHHthesis is the recommended choice over the original UHHthesis package.


## Features

- Pre-configured title page conforming to UHH/MIN faculty standards
- Declaration of authorship (auto-filled for PDF)
- Working examples with ggplot2, kableExtra, and flextable tables
- Citation management with BibTeX and CSL styles (APA pre-configured)
- Automatic chapter numbering, appendix lettering, and table of contents


## Quick Install

Navigate to the directory where you want your thesis project to live, then run one of the following commands in your terminal:

```bash
# English template
quarto use template uham-bio/quarto-UHHthesis/en

# German template
quarto use template uham-bio/quarto-UHHthesis/de
```

Answer **Yes** to both prompts (directory name and extension installation).

**Prerequisites:** [Quarto](https://quarto.org/docs/get-started/) (>= 1.3), [R](https://cran.r-project.org/) (>= 4.0), [TinyTeX](https://yihui.org/tinytex/) or another LaTeX distribution for PDF output.

For more details on installation, setup, and editor-specific instructions, see the
[Getting Started](docs/getting-started.md) guide.


## Project Structure

```
my-thesis/
├── _quarto.yml              # Main configuration (title, author, formats, bibliography)
├── index.qmd                # Entry point (title page metadata, abstract includes, LoF/LoT)
├── _extensions/UHHthesis/   # Format extension (do not edit)
│   ├── _extension.yml
│   ├── template.tex         # LaTeX template for PDF
│   └── uhh-template.docx    # Word reference template for DOCX
├── prelim/                  # Preliminary sections (abstract, Zusammenfassung, abbreviations)
├── chapter/                 # Thesis chapters, references, and appendices
├── bib/                     # Bibliography (.bib) and citation style (.csl)
├── data/                    # Data files (e.g., CSV)
└── images/                  # Images and logos
```


## Quick Render

```bash
quarto render                       # Both formats
quarto render --to UHHthesis-pdf    # PDF only
quarto render --to UHHthesis-docx   # DOCX only
```

Output files are placed in the `thesis-output/` directory. See the [Getting Started](docs/getting-started.md) guide for IDE-specific instructions (RStudio, Positron).


## Documentation

| Guide | Description        |
|:------|:-------------------|
| **[Getting Started](docs/getting-started.md)** | Installation, project setup, metadata configuration, first render |
| **[Writing Guide](docs/writing-guide.md)** | Cross-references, citations, figures, tables, equations, code chunks, appendices |
| **[Thesis Guide BSc and MSc](docs/Guide_Thesis_BSc_MSc_TheSans.pdf?raw=true)** | Guidance on the thesis project itself — from the initial research question to structuring your chapters, writing style, and final submission. Not template-specific. |
| **[Leitfaden Abschlussarbeit BSc und MSc](docs/Leitfaden_Abschlussarbeit_BSc_MSc_TheSans.pdf?raw=true)** | Deutsche Version des obigen Leitfadens |


## Useful Resources

- [Quarto documentation](https://quarto.org/docs/guide/)
- [Quarto books](https://quarto.org/docs/books/)
- [Quarto cross-references](https://quarto.org/docs/authoring/cross-references.html)
- [Quarto citations](https://quarto.org/docs/authoring/footnotes-and-citations.html)
- [CSL Style Repository](https://github.com/citation-style-language/styles)
- [Zotero reference manager](https://www.zotero.org/)
- [TinyTeX LaTeX distribution](https://yihui.org/tinytex/)
- [flextable book](https://ardata-fr.github.io/flextable-book/)

---

## Author

**Saskia Otto**
University of Hamburg · Department of Biology · Institute of Marine Ecosystem and Fisheries Science
[GitHub](https://github.com/saskiaotto) · [Website](https://www.biologie.uni-hamburg.de/forschung/marine-oekosystemdynamik/mitarbeiter/otto-saskia.html)