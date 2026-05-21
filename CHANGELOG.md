<h1 align="center">Changelog</h1>

***

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.1] - 2026-01-02

### Fixed
- Bug with jacobian and special syntax ([#3](https://github.com/ankaa3908/intexgral/issues/3)).
- French and English documentations ([#4](https://github.com/ankaa3908/intexgral/issues/4), [#6](https://github.com/ankaa3908/intexgral/issues/6) and [#7](https://github.com/ankaa3908/intexgral/issues/7)).

### Changed
- `positive` and `real` limits keywords; they now contain a `+` sign ([#5](https://github.com/ankaa3908/intexgral/issues/5)).

## [3.0.0] - 2025-12-24

### Added
- *special* syntax.
- `domain*` and `mode` keys.
- `\IntegralSetup` and `\NewSymbolKeyword` macros.

### Removed
- `\defaultdiff`, `\defaultvdiff` and `\vdiffstyle` in favour of `\IntegralSetup`.
- Keys controlling both the symbol and the limits, now managed at a higher level through `\NewSymbolKeyword`.
- `int-split` key in favour of `mode`.
- `\NewIntegralSymbol` macro.

### Changed
- Modified the names of some keys (`variables` to `variables`, `lower-lim` and `upper-lim` to `llimit` and `ulimit`, `int-symb` to `symbol`, `invert-differentials` and `hide-differentials` to `invert-diff` and `hide-diff`).
- Assigned `hide-diff` to a local option rather than a package one.
- Assigned `limits-mode` to a package option instead of a macro key.

## [2.0.1] - 2025-09-13

### Fixed
- Compatibility issue between unicode-math and amssymb depending on the loading order ([#2](https://github.com/ankaa3908/intexgral/issues/2)).

## [2.0.0] - 2025-09-09

### Added
- `\intexgralsetup`, `\defaultdiff`, `\defaultvdiff` and `\vdiffstyle` macros.

### Changed
- Warning messages related to non-existing symbols. They are now only triggered when the integral is typeset.

### Removed
- `diff-vec_style` key in favour of `\vdiffstyle` and warning messages about misuse of semi-colon in conjunction with the `int-split` key.

### Fixed
- Bug where the integrand was not reset when `\integral` was used successively in the same TeX group. Details can be [found here](https://tex.stackexchange.com/questions/749990/issue-with-integral-command-from-intexgral-package-in-math-mode).

## [1.1.0] - 2025-07-29

### Added
- Starred variants for the keys controlling both the symbol and the limits (keys `single`, `contour` etc).

## [1.0.0] - 2025-07-26

### Added
- Initial version.