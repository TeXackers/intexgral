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
  version       = "v3.0.1 2026-01-02",
  author        = "Valentin Dao",
  uploader      = "Valentin Dao",
  email         = "vdao.texdev@gmail.com",
  license       = "lppl1.3c",
  summary       = "A LaTeX package for typesetting integrals",
  ctanPath      = "/macros/latex/contrib/intexgral",
  announcement  =
    [[
        - Fixed bug with jacobian and special syntax (issue #3).
        - Fixed French and English documentations (issues #4, #6 and #7).
        - Changed "positive" and "real" limits keywords, they now contain a + sign (issue #5).
    ]],
  update        = true,
  repository    = "https://github.com/ankaa3908/intexgral/tree/main",
  bugtracker    = "https://github.com/ankaa3908/intexgral/issues"
}