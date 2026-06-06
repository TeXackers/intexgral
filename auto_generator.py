from dotenv import load_dotenv
from google import genai
import argparse
import re
import os

load_dotenv()

terminal_green = "\033[32m"
terminal_red = "\033[31 m"
terminal_reset = "\033[0m"

error_msg = f"{terminal_red} ERROR: {terminal_reset}"
success_msg = f"{terminal_green} SUCCESS: {terminal_reset}"

def generate_announcement():
  API_KEY = os.environ.get("GEMINI_API_KEY")
  if not API_KEY:
    raise ValueError("GEMINI_API_KEY environment variable not set.")
  try:
    with open("prompts/announcement_prompt.txt", "r", encoding="utf-8") as f:
      prompt_instructions = f.read()
    with open("CHANGELOG.md", "r", encoding="utf-8") as f:
        changelog_content = f.read()
  except FileNotFoundError as e:
    print(f"{error_msg} Missing file ({e.filename})")
    return 1
  full_prompt = prompt_instructions + 2*"\n" + changelog_content
  print("Sending request to Gemini...")
  client = genai.Client(api_key=API_KEY)
  try:
    response = client.models.generate_content(
      model='gemini-2.5-flash',
      contents=full_prompt,
    )
    
    with open("announcement.txt", "w", encoding="utf-8") as f:
      f.write(response.text)
      print(f"{success_msg} CTAN announcement written in announcement.txt")
  except Exception as e:
    print(f"{error_msg} The following error occurred while communicating with Gemini:")
    print(e)

def extract_changelog(filename):
  in_changelog = False
  lines = []
  start_pattern = r'%\s*\\begin{version}\s*\[\s*v=(\d+\.\d+\.\d+)\s*,\s*date=(\d{2}-\d{2}-\d{4})\s*\]'
  end_pattern = r'\\end{version}'

  with open(filename, "r", encoding="utf-8") as f:
    for line in f:
      if re.search(start_pattern, line):
        in_changelog = True
        lines.append(line)
        continue
        
      if in_changelog:
        lines.append(line)
        if re.search(end_pattern, line):
          break
    return ''.join(lines)

def generate_changelog():
  API_KEY = os.environ.get("GEMINI_API_KEY")
  if not API_KEY:
    raise ValueError("GEMINI_API_KEY environment variable not set.")
  try:
    with open("prompts/changelog_prompt.txt", "r", encoding="utf-8") as f:
      prompt_instructions = f.read()
    with open("CHANGELOG.md", "r", encoding="utf-8") as f:
      changelog_content = f.read()
  except FileNotFoundError as e:
    print(f"{error_msg} Missing file ({e.filename})")
    return 1
  try:
    dtx_content = extract_changelog("intexgral-en.dtx")
  except FileNotFoundError as e:
    print(f"{error_msg} Missing file ({e.filename})")
    return 1

  full_prompt = prompt_instructions + 2*"\n" + changelog_content + 2*"\n" + dtx_content
  print("Sending request to Gemini...")
  client = genai.Client(api_key=API_KEY)

  try:
    response = client.models.generate_content(
        model='gemini-2.5-flash',
        contents=full_prompt,
    )

    print("\n" + "="*40)
    print("UPDATED CHANGELOG:")
    print("="*40)
    print(response.text)
    print("="*40 + "\n")
    user_input = input("Would you like to update the changelog with these changes? [Y/N] : ").strip().lower()
    if user_input in ['y', 'yes', '']:
      with open("CHANGELOG.md", "w", encoding="utf-8") as f:
          f.write(response.text)
      print(f"{success_msg} Changelog summary written in CHANGELOG.md")
    else:
      print(f"{error_msg} Update cancelled. The CHANGELOG.md file has not been modified.")
      return 0
  except Exception as e:
    print(f"{error_msg} The following error occurred while communicating with Gemini:")
    print(e)
    return 1
  return 0

if __name__ == "__main__":
  parser = argparse.ArgumentParser(description='Generate some package info using Gemini')
  parser.add_argument(
      'function',
      choices=['announcement', 'changelog', 'all'],
      default='all',
      nargs='?',
      help='Function to execute (announcement, changelog, all)'
  )
  
  args = parser.parse_args()
  
  if args.function == 'announcement':
    generate_announcement()
  elif args.function == 'changelog':
    generate_changelog()
  else:
    generate_announcement()
    generate_changelog()