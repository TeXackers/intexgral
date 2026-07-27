#!/usr/bin/env python3
from dotenv import load_dotenv
from google import genai
from rich.console import Console
from rich.progress import Progress, SpinnerColumn, TextColumn, BarColumn, TimeElapsedColumn
from rich.prompt import Prompt
import argparse
import glob
import re
import os
import sys

load_dotenv()

console = Console()

def check_logs():
    dtx_files = glob.glob("*.dtx")
    modules = [
        "cs",
        "tl_anaylsis",
        "regex",
        "bool",
        "ior",
        "iow",
        "tl",
        "str",
        "seq",
        "int",
        "flat",
        "clist",
        "prop",
        "dim",
        "skip",
        "muskip",
        "intarray",
        "fp",
        "bistset",
        "box",
        "coffin",
    ]
    for dtx_file in dtx_files:
        with open(dtx_file, "r", encoding="utf-8") as f:
            content = f.read()
            for module in modules:
                log_pattern = rf"\\{module}_log:"
                if re.search(log_pattern, content):
                    console.print(f"[bold red]ERROR:[/bold red] Found log remnant in {dtx_file}: {log_pattern}")
                    sys.exit(1)
                else:
                    console.print(f"[green]INFO:[/green] No log remnant found in {dtx_file} for module {module}.")

def checklist():
    questions = [
        "Have logs remnant been deleted?",
        "Are the dates up to date in README/Changelog/.dtx/.ins?",
        "Has the tag been updated?",
        "Is the .ins file set to generate .sty from english .dtx?"
        "Has the announcement file been modified?",
    ]
    for question in questions:
        answer = Prompt.ask(f"[yellow]{question}[/yellow]", choices=["y", "n"], default="y")
        if answer.lower() != "y":
            console.print(f"[bold red]ERROR:[/bold red] Please address the issue.")
            sys.exit(1)
        else:
            console.print(f"[green]INFO:[/green] {question} - OK")

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
        console.print(f"[bold red]ERROR:[/bold red] Missing file ({e.filename})")
        sys.exit(1)

    full_prompt = prompt_instructions + 2*"\n" + changelog_content
    console.print(f"[blue] INFO:[/blue] Sending request to Gemini...")
    client = genai.Client(api_key=API_KEY)
    try:
        response = client.models.generate_content(
            model='gemini-2.5-flash',
            contents=full_prompt,
        )
        with open("announcement.txt", "w", encoding="utf-8") as f:
            if response.text is None:
                console.print(f"[bold red]ERROR:[/bold red] Gemini returned no content.")
                sys.exit(1)
            else:
                f.write(response.text)
                console.print(f"[green] SUCCESS:[/green] Announcement written in announcement.txt")
    except Exception as e:
        console.print(f"[bold red]ERROR:[/bold red] The following error occurred while communicating with Gemini:")
        console.print(e)

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
        console.print(f"[bold red]ERROR:[/bold red] Missing file ({e.filename})")
        sys.exit(1)
    try:
        dtx_content = extract_changelog("intexgral-en.dtx")
    except FileNotFoundError as e:
        console.print(f"[bold red]ERROR:[/bold red] Missing file ({e.filename})")
        sys.exit(1)

    full_prompt = prompt_instructions + 2*"\n" + changelog_content + 2*"\n" + dtx_content
    console.print(f"[blue] INFO:[/blue] Sending request to Gemini...")
    client = genai.Client(api_key=API_KEY)

    try:
        response = client.models.generate_content(
            model='gemini-2.5-flash',
            contents=full_prompt,
        )

        console.rule("[bold blue] UPDATED CHANGELOG [/bold blue]")
        console.print(response.text)
        console.rule()
        user_confirmation = Prompt.ask("[yellow]Do you want to overwrite the existing CHANGELOG.md with the new content?[/yellow]", choices=["y", "n"], default="y")
        if user_confirmation.lower() == "y":
            with open("CHANGELOG.md", "w", encoding="utf-8") as f:
                if response.text is None:
                    console.print(f"[bold red]ERROR:[/bold red] Gemini returned no content.")
                    sys.exit(1)
                else:
                    f.write(response.text)
                    console.print(f"[green] SUCCESS:[/green] CHANGELOG.md has been updated.")
    except Exception as e:
        console.print(f"[bold red]ERROR:[/bold red] The following error occurred while communicating with Gemini:")
        console.print(e)
        sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description="Automate changelog and announcement generation.")
    subparsers = parser.add_subparsers()
    parser_checklist = subparsers.add_parser("checklist", help="Run the checklist for release preparation.")
    parser_checklist.set_defaults(func=checklist)
    parser_check_logs = subparsers.add_parser("checklogs", help="Check for log remnants in .dtx files.")
    parser_check_logs.set_defaults(func=check_logs)
    parser_generate_announcement = subparsers.add_parser("announce", help="Generate the announcement file using Gemini API.")
    parser_generate_announcement.set_defaults(func=generate_announcement)
    parser_generate_changelog = subparsers.add_parser("changelog", help="Generate the changelog file using Gemini API.")
    parser_generate_changelog.set_defaults(func=generate_changelog)
    args = parser.parse_args()
    args.func()

if __name__ == "__main__":
    main()