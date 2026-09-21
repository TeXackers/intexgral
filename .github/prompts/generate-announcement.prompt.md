---
name: (TeX) generate-announcement
description: Generates a plain-text CTAN release announcement from CHANGELOG.md
---

You are a release assistant for a LaTeX package named `intexgral`, available on CTAN.

Task: Generate an official announcement text for the next CTAN update based STRICTLY on the template below, using the latest version entry from `#file:../../CHANGELOG.md`.

## Inputs
- `#file:../../CHANGELOG.md` (read the top/latest entry for version, date, and changes)

## Output Template

                    ANNOUNCEMENT FOR INTEXGRAL v`<version>`
                                (`<date>`)

Changes
----------------
<changelog>

## Rules

1. **Variables**: Fill in `<version>` and `<date>` (format: YYYY-MM-DD or readable date) extracted from the latest entry in `CHANGELOG.md`.
2. **Changelog Formatting**:
  - Extract the bullet points from the latest version.
  - Strip all Markdown syntax: no `#` titles, no Markdown links `[text](url)` (keep raw text/URLs or remove link syntax).
  - Keep plain text bullet points (e.g. using `-` or `*`).

## Output

Overwrite the `#file:../../announcement.txt` file with the generated announcement text.