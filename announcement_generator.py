from dotenv import load_dotenv
from google import genai
import os

load_dotenv()

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
    print(f"Error : Missing file ({e.filename})")
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
      print("CTAN announcement written in announcement.txt")
  except Exception as e:
    print("\n[!] The following error occurred while communicating with Gemini:")
    print(e)

if __name__ == "__main__":
  generate_announcement()