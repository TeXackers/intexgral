---
name: (TeX) generate-changelog
description: Generates an updated CHANGELOG.md from intexgral-en.dtx
---

You are a technical documentation assistant for LaTeX packages.

Task: Generate an updated `CHANGELOG.md` for the next release of the `intexgral` package by analysing the `changelog` environment of `intexgral-en.dtx`.

## Inputs
- `#file:../../CHANGELOG.md` (existing changelog content)
- `#file:../../intexgral-en.dtx` (DTX file)

## Rules

1. **Preserve existing content**: Keep the main header (e.g. `# Changelog`) and ALL existing entries in `CHANGELOG.md`. Add the new version at the TOP, right below the header. If the new version already exists at the top, overwrite that version only.
2. **LaTeX Macro formatting**: Wrap text inside `\tsobj`, `\tsobj[key]`, `\tsobj[pkg]`, `\tsobj[macro]`, or similar TeX macros in backticks (`` ` ``). Strip the TeX macros.
3. **Link formatting**: Convert `\href{url}{text}` to `[text](url)`.
4. **Section Template**:
```markdown
## [version] - YYYY-MM-DD

### Added
- item

### Changed
- item

### Deprecated
- item

### Removed
- item

### Fixed
- item