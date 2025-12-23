# `intexgral` – A LaTeX package for typesetting integrals

---

![Static Badge](https://img.shields.io/badge/LaTeX_3-blue?style=for-the-badge&logo=LaTeX&logoColor=%23008080&labelColor=%23EDE9E9&color=%23008080)

![CTAN Version](https://img.shields.io/ctan/v/intexgral?style=flat-square&label=CTAN%20version&link=https%3A%2F%2Fctan.org%2Fpkg%2Fintexgral) ![CTAN License](https://img.shields.io/ctan/l/intexgral?style=flat-square&label=License&color=orange) ![Static Badge](https://img.shields.io/badge/Requires-expl3_2025--05--14-purple?style=flat-square) ![Static Badge](https://img.shields.io/badge/Verification_system-l3build-%2300007D?style=flat-square)

---

## Requirements

The package requires the [pkginfograb](https://ctan.org/pkg/pkginfograb) one. Having installed this package should normally ensure a LaTeX3 version newer than 2025-05-14, which is necessary for the good functioning of *intexgral*.

## Installation

The latest version can be found on its [CTAN page](https://ctan.org/pkg/intexgral).

## Usage

Simply write

```TeX
\usepackage{intexgral}
```

in the preamble of your document.

## Description

The package provides a central macro `\integral` that helps typeset integrals. As it only contains one argument – the integrand – its use is heavily dependent of a `key = value` interface. The latter allows the user to customise many elements of an integral, including:

##### On the package side

* Adaptation of the style to physics papers convention.
* Selection of the order of limits input.
* Choosing between upright or italic *d* for differentials.

##### On the macro side

* Changing the symbol.
* Automate the composition of integrals with limits.
* Fine adjustment of differentials.
* Inclusion of the Jacobian.

The package also offers a couple of auxiliary macros to help enhance the use of some keys:

* `\NewLimitsKeyword` (and its variant) to associate keywords with common limits.
* `\NewVariableKeyword` (and its variant) to associate keywords to common lists of differential (and Jacobian).
* `NewSymbolKeyword` (and its variant) to associate symbols to user-friendly keys.
* `\differentials` to precisely place the differentials wherever the user wants to.

and much more... See the [documentation](https://mirrors.ircam.fr/pub/CTAN/macros/latex/contrib/intexgral/intexgral-en.pdf) for exhaustive presentation of all the features along with examples.

## Author

Copyright 2025-present Valentin Dao

This work may be distributed and/or modified under the conditions of The [LaTeX Project Public License v1.3c](https://www.latex-project.org/lppl/lppl-1-3c.pdf) or later.

This work has the LPPL status *maintained*.

The current maintainer of of this work is Valentin Dao (`vdao.texdev@gmail.com`)

Contribution: Anthony Saint-Criq

## This work consits of the files

* `README.md` (this file)
  * Quick introduction to the package.
* `build.lua`
  * Configuration file to build the package.
* `intexgral.ins`
  * Installation file to extract the different main components of the package.
* `intexgral-fr.dtx`
  * The **D**ocumented **T**e**X** file containing the French documentation
* `intexgral-en.dtx`
  * The **D**ocumented **T**e**X** file containing the English documentation

Both `.dtx` files, when run through the `.ins` file, will produce the following:

* `intexgral.sty`
  * The source code of the package.
* `intexgral-fr.pdf`
  * The French documentation in PDF format.
* `intexgral-en.pdf`
  * The English documentation in PDF format.

## Change log

* Version 3.0.0 (2025-12-24)
  * Added *special* syntax.
  * Added `domain*` and `mode` keys.
  * Added `\IntegralSetup` and `\NewSymbolKeyword` macros.
  * Removed `\defaultdiff`, `\defaultvdiff` and `\vdiffstyle` in favour of `\IntegralSetup`.
  * Removed keys controlling both the symbol and the limits, now managed at a higher level through `\NewSymbolKeyword`.
  * Removed `int-split` key in favour of `mode`.
  * Removed `\NewIntegralSymbol`
  * Modified the names of some keys (`variables` to `variables`, `lower-lim` and `upper-lim` to `llimit` and `ulimit`, `int-symb` to `symbol`, `invert-differentials` and `hide-differentials` to `invert-diff` and `hide-diff`).
  * Assigned `hide-diff` to a local option rather than a package one.
  * Assigned `limits-mode` to a package option instead of a macro key.
* Version 2.0.1 (2025-09-13)
  * Compatibiliy issue between unicode-math and amssymb depending on the loading order ([issue #2](https://github.com/ankaa3908/intexgral/issues/2))
* Version 2.0.0 (2025-09-09)
  * Added `\intexgralsetup`, `\defaultdiff`, `\defaultvdiff` and `\vdiffstyle`.
  * Changed warning messages related to non-existing symbols. They are now only triggered when the integral is typeset.
  * Removed `diff-vec_style` key in favour of `\vdiffstyle` and warning messages about misuse of semi-colon in conjunction with the `int-split` key.
  * Fixed bug where the integrand was not reset when `\integral` was used successively in the same TeX group. Details can be [found here](https://tex.stackexchange.com/questions/749990/issue-with-integral-command-from-intexgral-package-in-math-mode).

* Version 1.1.0 (2025-07-29)
  * Added starred variants for the keys controlling both the symbol and and the limits (keys `single`, `contour` etc).

* Version 1.0.0 (2025-07-26)
  * Initial version
