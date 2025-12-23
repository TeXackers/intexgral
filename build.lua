module = "intexgral"

unpackfiles = {"*.ins"}
unpackdir = "package"

sourcefiles = {"*.ins", "*.dtx"}

docfiledir = "/package"

typesetfiles = {"*.dtx"}

typesetexe = "lualatex"
typesetopts = "-interaction=nonstopmode"

distribdir = "public"

uploadconfig = {
  pkg           = "intexgral",
  version       = "v3.0.0 2025-12-24",
  author        = "Valentin Dao",
  uploader      = "Valentin Dao",
  email         = "vdao.texdev@gmail.com",
  license       = "lppl1.3c",
  summary       = "A LaTeX package for typesetting integrals",
  ctanPath      = "/macros/latex/contrib/intexgral",
  announcement  =
    [[
        Added:
        - special syntax
        - keys "domain*" and "mode"
        - new macro \IntegralSetup to more easily change some integral-related parameters

        Some keys and macros were removed in favour of the new features. Many key names were also changed to be both easier to type and remember (the package lacked consistency on this matter). In addition, the package's performance was greatly improved. Many small unnoticed bugs were also corrected.
    ]],
  update        = true,
  repository    = "https://github.com/ankaa3908/intexgral/tree/main",
  bugtracker    = "https://github.com/ankaa3908/intexgral/issues"
}