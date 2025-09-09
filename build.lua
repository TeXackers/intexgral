module = "intexgral"

unpackfiles = {"*.ins"}
unpackdir = "package"

sourcefiles = {"*.ins", "*.dtx"}

docfiledir = "/package"

typesetfiles = {"intexgral-en.tex", "intexgral-fr.tex"}

typesetexe = "lualatex"
typesetopts = "-interaction=nonstopmode -shell-escape"

distribdir = "public"