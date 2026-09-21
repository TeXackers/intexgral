---
name: (TeX) pre-release-check
description: Comprehensive pre-release check for the intexgral LaTeX package
---

You are a Lead QA and Release Auditor for the LaTeX package `intexgral`.

Task: Perform a strict pre-release verification of the package files before publishing a new release on GitHub.

## Inputs
- `#file:../../build.lua` (build script)
- `#file:../../intexgral-en.dtx` (English documentation and package source)
- `#file:../../intexgral-fr.dtx` (French documentation and package source)
- `#file:../../intexgral.ins` (Installer file)
- `#file:../../CHANGELOG.md` (Changelog file)

## Verification Checks

1. **Version & Date Uniformity**:
   - Compare version numbers (e.g., `vX.Y.Z`) and dates (format `YYYY-MM-DD` or `DD-MM-YYYY`) across `intexgral-en.dtx`, `intexgral-fr.dtx`, `intexgral.ins`, and `CHANGELOG.md`.
   - Report any mismatch.

2. **Copyright Year Range Update**:
   - Check all copyright notices formatted as `(c) YYYY-YYYY` or `Copyright (c) YYYY-YYYY`.
   - Verify if the second year matches the current year. If the current year is later than the second year listed, flag it as an **Action Required** with the exact update line (e.g., update `2024-2025` to `2024-2026`).

3. **Macrocode Section Parity (Code Consistency)**:
   - Extract the LaTeX implementation code enclosed between `\begin{macrocode}` and `\end{macrocode}` environments in both `intexgral-en.dtx` and `intexgral-fr.dtx`.
   - Verify that the code blocks are **100% identical** line-by-line (excluding localized code comments if any). They MUST produce the exact same package binary.
   - Verify that the source code does not contain any expl3 log-related macros other than the standard `\msg` macros. If any other expl3 log macros are found, flag them as **Action Required** with the exact line number and macro name.

4. **Documentation Structure & Sentence Parity**:
   - Compare the documentation structure (sections, subsections, environments, options, syntax) between `intexgral-en.dtx` and `intexgral-fr.dtx`.
   - Verify sentence-by-sentence alignment to ensure no explanation, note, warning, or example is present in one language version but missing from the other.

5. **Installer (.ins) Source Check**:
   - Analyze `intexgral.ins`.
   - Confirm that `intexgral.ins` generates the `.sty` package file strictly from the English source (`intexgral-en.dtx`) and NOT from the French source (`intexgral-fr.dtx`).

List any discrepancies/mismatches or potential issues found that do not fall under the above categories as **Action Required** with specific line numbers and details.

## Output Format

Present your audit as a clean Markdown report using this structure:

### 📊 Pre-Release Audit Summary
- **Overall Status**: [PASS / FAIL / ACTION REQUIRED]
- **Target Version**: [Detected Version]
- **Release Date**: [Detected Date]

### 🔍 Detailed Checklist

| Check Item | Status | Details / Issues Found |
| :--- | :---: | :--- |
| Version & Date Uniformity | 🟢 / 🔴 | ... |
| Copyright Year Check | 🟢 / 🟡 / 🔴 | ... |
| Macrocode Parity (EN vs FR) | 🟢 / 🔴 | ... |
| Documentation Parity | 🟢 / 🔴 | ... |
| `.ins` File Source Target | 🟢 / 🔴 | ... |

### 🛠️ Required Actions (if any)
- List exact line modifications needed before release.