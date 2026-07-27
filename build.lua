-- Package name
module = "intexgral"

-- Directory for unpacking sources
unpackdir = "package"

typesetexe = "lualatex"
typesetopts = "-synctex=1 -recorder -halt-on-error"

-- Directory for organizing files for CTAN
distribdir = "public"

-- Files for automatic tagging
tagfiles = {"*.ins", "*.dtx"}

local pkg_description = [[
Typesetting integrals, although common in LaTeX, is not particularly practical. The way in which the different parts are managed often generates unreadable source code, making modifications laborious. The package therefore follows a simple philosophy: focus on the essential element of an integral, the integrand. Everything else (limits, differentials, symbols) can be modified using keys. These keys are designed to allow you to easily and quickly change the style of an integral. Additionally, the package provides various auxiliary macros to support some keys which can have lengthy inputs.
]]

uploadconfig = {
   pkg                 = "intexgral",
   version             = "v4.1.0 2026-07-27",
   author              = "Valentin Dao",
   uploader            = "Valentin Dao",
   email               = "vdao.texdev@gmail.com",
   license             = "lppl1.3c",
   summary             = "A LaTeX package for typesetting integrals",
   description         = pkg_description,
   ctanPath            = "/macros/latex/contrib/intexgral",
   announcement_file   = "announcement.txt",
   update              = true,
   topic               = "maths",
   repository          = "https://github.com/TeXackers/intexgral/tree/master",
   bugtracker          = "https://github.com/TeXackers/intexgral/issues"
}

dofile('build-config.lua')