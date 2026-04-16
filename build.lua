module = "intexgral"

unpackfiles = {"*.ins"}
unpackdir = "package"

sourcefiles = {"*.ins", "*.dtx"}

docfiledir = "./package"

typesetfiles = {"*.dtx"}

typesetexe = "lualatex"
typesetopts = "-interaction=nonstopmode"

distribdir = "public"

testfiledir = "./testfiles"

uploadconfig = {
  pkg                 = "intexgral",
  version             = "v3.1.1",
  author              = "Valentin Dao",
  uploader            = "Valentin Dao",
  email               = "vdao.texdev@gmail.com",
  license             = "lppl1.3c",
  summary             = "A LaTeX package for typesetting integrals",
  ctanPath            = "/macros/latex/contrib/intexgral",
  announcement_file   = "announcement.txt",
  update              = true,
  repository          = "https://github.com/TeXackers/intexgral/tree/main",
  bugtracker          = "https://github.com/TeXackers/intexgral/issues"
}