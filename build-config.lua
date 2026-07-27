function update_tag(file, content, tagname, tagdate)
   -- Update the copyright year
   local creation_year = 2025
   local current_year = tonumber(os.date("%Y"))
   local copyright_single = "%(C%)%s*%d%d%d%d%s*Valentin%sDao"
   local copyright_range  = "%(C%)%s*%d%d%d%d%-%d%d%d%d%s*Valentin%sDao"

   local new_copyright_year
   if current_year == creation_year then
      new_copyright_year = string.format("(C) %d Valentin Dao", creation_year)
   else
      new_copyright_year = string.format("(C) %d-%d Valentin Dao", creation_year, current_year)
   end
   content = content:gsub(copyright_single, new_copyright_year)
   content = content:gsub(copyright_range, new_copyright_year)
   -- Update the package information
   local pkg_name = uploadconfig.pkg
   local new_date = tagdate or os.date("%Y-%m-%d")
   local new_version = tagname or uploadconfig.version
   local description = uploadconfig.summary

   local pattern =
      "\\def\\intexgral@module[^\n]+\n" ..
      "\\def\\intexgral@version[^\n]+\n" ..
      "\\def\\intexgral@date[^\n]+\n" ..
      "\\def\\intexgral@description[^\n]+"

   local replacement = string.format(
      "\\def\\intexgral@module{%s}\n" ..
      "\\def\\intexgral@version{%s}\n" ..
      "\\def\\intexgral@date{%s}\n" ..
      "\\def\\intexgral@description{%s}",
      pkg_name, new_version, new_date, description
   )

   return content:gsub(pattern, replacement)
end

function generate_ai_announcement()
   os.execute("python auto_generator.py announce")
end

function generate_ai_changelog()
   os.execute("python auto_generator.py changelog")
end

function checklist()
   os.execute("python auto_generator.py checklist")
end

function checklogs()
   os.execute("python auto_generator.py checklogs")
end

target_list = target_list or {}

target_list['checklist'] = {
   func = checklist,
   desc = 'Performs a checklist verification before upload.'
}

target_list['announce'] = {
   func = generate_ai_announcement,
   desc = "Generates CTAN announcement using Gemini."
}

target_list['changelog'] = {
   func = generate_ai_changelog,
   desc = "Generates changelog using Gemini."
}

target_list['checklogs'] = {
   func = checklogs,
   desc = "Checks for remnant logs in documentation."
}