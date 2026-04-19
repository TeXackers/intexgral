<div align="center">

<h3 align="center">Intexgral</h3>

  <p align="center">
    A LaTeX package for typesetting integrals
    <br />
    <br />
    <a href="https://mirror.ibcp.fr/pub/CTAN/macros/latex/contrib/intexgral/intexgral-en.pdf">Explore the docs</a>
    &middot;
    <a href="https://github.com/ankaa3908/intexgral/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/ankaa3908/intexgral/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
    <br />
    <br />
    <img alt="Static Badge" src="https://img.shields.io/badge/LATEX_3-teal?style=for-the-badge&logo=latex&logoColor=teal&logoSize=auto&labelColor=white&color=teal">
    <img alt="CTAN License" src="https://img.shields.io/ctan/l/intexgral?style=for-the-badge&color=salmon">
    <img alt="CTAN Version" src="https://img.shields.io/ctan/v/intexgral?style=for-the-badge&color=rebeccapurple">
    <img alt="GitHub Issues or Pull Requests" src="https://img.shields.io/github/issues/ankaa3908/intexgral?style=for-the-badge">
    <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/ankaa3908/intexgral?style=for-the-badge&logo=github&logoSize=auto&color=mediumseagreen">
  </p>
</div>

***

## About The Project

Typesetting integrals, although common in LaTeX, is not particularly practical. The way in which the different parts are managed often generates unreadable source code, making modifications laborious. The package therefore follows a simple philosophy: focus on the essential element of an integral, the integrand. Everything else (limits, differentials, symbols) can be modified using keys. These keys are designed to allow you to easily and quickly change the style of an integral. Additionally, the package provides various auxiliary macros to support some keys which can have lengthy inputs.

### Built With

![Static Badge](https://img.shields.io/badge/l3build-royalblue?style=for-the-badge&logoColor=white&logoSize=auto)

## Installation

The latest version can be found on its [CTAN page](https://ctan.org/pkg/intexgral). Simply download the `intexgral-en.dtx` and `intexgral.ins` files. Then, run

```
pdf(la)tex|xe(la)tex|lua(la)tex intexgral.ins
```

and place the resultant `.sty` file in your working directory or in your texmf tree. If you're using a TeX distribution, you can run:

##### For TeXlive
```
tlmgr install intexgral
```

##### For MikTeX
```
mpm --install=intexgral
```

## Usage

The package provides a central macro `\integral` that helps typeset integrals. As it only contains one argument, the integrand, its use is heavily dependent of a `key=value` interface. The latter allows the user to customise many elements of an integral, including:

### On the package side

* Adaptation of the style to physics papers convention.
* Selection of the order of limits input.
* Choosing between upright or italic *d* for differentials.

### On the macro side

* Changing the symbol.
* Automate the composition of integrals with limits.
* Fine adjustment of differentials.
* Inclusion of the Jacobian.

The package also offers a couple of auxiliary macros to help enhance the use of some keys:

* `\NewLimitsKeyword` to associate keywords with common limits.
* `\NewVariableKeyword` to associate keywords to common lists of differential (and Jacobian).
* `\NewSymbolKeyword` to associate symbols to user-friendly keys.
* `\differentials` to precisely place the differentials wherever the user wants to.

_For more examples, please refer to the Documentation_

## Contributing

Contributions are always welcome. Check the `CONTRIBUTING.md` file for more information.

## License

This work may be distributed and/or modified under the conditions of The [LaTeX Project Public License v1.3c](https://www.latex-project.org/lppl/lppl-1-3c.pdf) or later.

This work has the LPPL status *maintained*. The current maintainer of this work is Valentin Dao.

This work consists of the file listed in the `MANIFEST.md` file.

See `LICENSE` for more information.

## Contact

Valentin Dao: [email](mailto:vdao.texdev@gmail.com)

### Top contributors:

<a href="https://github.com/ankaa3908/intexgral/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ankaa3908/intexgral" alt="contrib.rocks image" />
</a>