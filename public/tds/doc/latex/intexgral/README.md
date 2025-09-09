# `intexgral` – A LaTeX package for typesetting integrals

---

![Static Badge](https://img.shields.io/badge/LaTeX_3-blue?style=for-the-badge&logo=LaTeX&logoColor=%23008080&labelColor=%23EDE9E9&color=%23008080)

![CTAN Version](https://img.shields.io/ctan/v/intexgral?style=flat-square&label=CTAN%20version&link=https%3A%2F%2Fctan.org%2Fpkg%2Fintexgral) ![CTAN License](https://img.shields.io/ctan/l/intexgral?style=flat-square&label=License&color=orange) ![Static Badge](https://img.shields.io/badge/Requires-expl3_2025--05--14-purple?style=flat-square) ![Static Badge](https://img.shields.io/badge/Verification_system-l3build-%2300007D?style=flat-square)

---

## Description

The package provides a central macro `\integral` that helps typeset integrals. As it only contains one argument – the integrand – its use is heavily dependent of a `key = value` interface. The latter allows the user to customise many elements of an integral, including:

__On the package side__
- Adaptation of the style to physics papers convention.
- Selection of the order of limits input.
- Choosing between upright or italic *d* for differentials.

__On the macro side__
- Changing the symbol.
- Automate the composition of integrals with limits.
- Fine adjustment of differentials.
- Inclusion of the Jacobian.

For instance, consider this code:

```latex
\begin{equation}
  \int_0^R \rho \mathrm{d}\rho \int_0^H z \mathrm{d}z \int_0^{2\pi} \phi \mathrm{d} \phi
\end{equation}
```

can easily be rewritten like so:

```latex
\begin{equation}
  \integral[int-split=true,limits={0, R; 0, H; 0, 2\pi}, variable={\rho, z,\phi}]{\rho; z;\phi}
\end{equation}
```

The package also offers a couple of auxiliary macros to help enhance the use of some keys:

- `\NewLimitsKeyword` (and its variant) to associate keywords with common limits.
- `\NewDifferentialKeyword` (and its variant) to associate keywords to common lists of differential (and Jacobian).
- `\differentials` to precisely place the differentials wherever the user wants to.
- `\defaultdiff` & `\defaultvdiff` for changing the default differential.

and much more... See the documentation for exhaustive presentation of all the features along with examples.

## Author

This package is maintained by Valentin Dao: vdao.texdev@gmail.com

Contribution: Anthony Saint-Criq

## License

Released under the [LaTeX Project Public License v1.3c](https://www.latex-project.org/lppl/lppl-1-3c.pdf) or later.

This work has the LPPL maintenance status `maintained`.

## Files

The bundle contains the following files:
```
README.md                   This file.
intexgral.ins               The installation file.
intexgral.dtx               The source file, along with the derived files:
- intexgral-doc-en.pdf      The english package documentation in PDF format.
- intexgral-doc-fr.pdf      The french package documentation in PDF format.
```
