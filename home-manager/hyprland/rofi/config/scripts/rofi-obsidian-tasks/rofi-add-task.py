#!/usr/bin/env python

from pathlib import Path
from datetime import datetime, timedelta
from utils import get_category, rofi_dmenu, rofi_input, append_to_file

basePath = Path("/home/yanni/Neponotes/TODOs/")
assert basePath.exists()

categories = {}
for path in basePath.glob("*"):
    if not path.name.endswith('.md'):
        continue
    category = get_category(path)
    if category is not None:
        categories[category] = path

selected_category = rofi_dmenu(list(categories.keys()),"Choose a category")

task = rofi_input("What's your task?")

if task is not None:
    taskContent = f"\n- [ ] #todo {task}"
else:
    taskContent = ""

due_date = rofi_dmenu(["Today", "Tomorrow", "Next Week", "Custom", "None"], "Due Date?")

if due_date == "Custom":
    due_date = rofi_input("Enter date:")
elif due_date == "None":
    due_date = None
elif due_date == "Today":
    due_date = datetime.now().date().strftime("%Y-%m-%d")
elif due_date == "Tomorrow":
    today = datetime.now().date()
    tomorrow = today + timedelta(days=1)
    due_date = tomorrow.strftime("%Y-%m-%d")
elif due_date == "Next Week":
    today = datetime.now().date()
    days_ahead = (0 - today.weekday() + 7) % 7
    if days_ahead == 0:
        days_ahead += 7
    next_monday = today + timedelta(days=days_ahead)
    due_date = next_monday.strftime("%Y-%m-%d")

if due_date is not None:
    taskContent += f"📅 {due_date}"

if taskContent is not None:
    append_to_file(categories[selected_category], taskContent)


