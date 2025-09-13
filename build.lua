module = "intexgral"

unpackfiles = {"*.ins"}
unpackdir = "package"

sourcefiles = {"*.ins", "*.dtx"}

docfiledir = "/package"

typesetfiles = {"intexgral-en.tex", "intexgral-fr.tex"}

typesetexe = "lualatex"
typesetopts = "-interaction=nonstopmode -shell-escape"

distribdir = "public"

uploadconfig = {
  pkg           = "intexgral",
  version       = "v2.0.1 2025-09-13",
  author        = "Valentin Dao",
  uploader      = "Valentin Dao",
  email         = "vdao.texdev@gmail.com",
  license       = "lppl1.3c",
  summary       = "A LaTeX package for typesetting integrals",
  ctanPath      = "/macros/latex/contrib/intexgral",
  announcement  = [[
      Fixed: 
      - Compatibility issue between amssymb and unicode-math.
  ]],
  update        = true,
  repository    = "https://github.com/ankaa3908/intexgral/tree/main",
  bugtracker    = "https://github.com/ankaa3908/intexgral/issues"
}