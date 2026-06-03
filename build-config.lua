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

function checklist()
  local reset = "\027[0m"
  local questions = {
    "Have logs remnant been deleted?",
    "Are the dates up to date in README/Changelog/.dtx/.ins?",
    "Has the tag been updated?",
    "Has the announcement file been modified?",
  }
  
  for i, question in ipairs(questions) do
    io.write(string.format("[%d/%d] %s (Y/N): ", i, #questions, question))  
    local response = io.read()
    if response:upper() ~= 'Y' then
      local red = "\027[31m"
      print("\n" .. red .. "CHECKLIST FAILED: " .. reset .. "Please address the issue before uploading.")
      return 1
    end
  end

  local green = "\027[32m"
  
  print("\n" .. green .. "SUCCESS: " .. reset .. "Checklist completed!")
  return 0
end

function check_logs()
  local modules = {
    "tl",
    "int",
    "prop",
    "seq",
    "clist",
    "fp",
    "str",
    "muskip"
  }
  local doc_en, doc_fr = assert(io.open("intexgral-en.dtx", "r")), assert(io.open("intexgral-fr.dtx", "r"))
  local doc_en_content, doc_fr_content = doc_en:read("*a"), doc_fr:read("*a")
  for _, module in ipairs(modules) do
    local log = "\\" .. module .. "_log:N"
      if doc_en_content:find(log) or doc_fr_content:find(log) then
        print(string.format("[ERROR] Found remnant log: %s", log))
        return 1
      end
  end
  print("[SUCCESS] No remnant logs found.")
  return 0
end

function generate_ai_announcement()
  os.execute("python auto_generator.py announcement")
end

function generate_ai_changelog()
  os.execute("python auto_generator.py changelog")
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
  func = check_logs,
  desc = "Checks for remnant logs in documentation."
}