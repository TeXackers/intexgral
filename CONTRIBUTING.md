Thanks for contributing to intexgral! Feedback, fixes and ideas are all useful.

## Contribution to the Code

- You need to install `l3build` and `ppmcheckpdf` packages into your TeX distribution first.

- After editing the source code, run `l3build save` then `l3build check` to compile test files.

- Subsequently `ppmcheckpdf save` then `ppmcheckpdf check` to compare MD5 checksums for test outputs.

## Contribution to the Manual

- Contribution to the manual is also appreciated. If you wish to compile the documentation as a result of your modifications, make sure to run the `lualatex` engine and **comment out all font declaration at the beginning of the document.**
