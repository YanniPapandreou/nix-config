from typing import Union, List
from pathlib import Path
import yaml
import subprocess


def rofi_dmenu(options: List[str], prompt: str):
    # Format options as newline-separated string
    options_string = '\n'.join(options)

    # Construct the Rofi command with dmenu mode and the options
    # rofi -dmenu -sorting-method fzf -sort -matching fuzzy -i
    command = ['rofi', '-dmenu', '-i', '-p', prompt, '-sorting-method', 'fzf', '-sort', '-matching', 'fuzzy', '-format', 'i']
    # Execute the Rofi command and capture the output
    try:
        output = subprocess.check_output(command, input=options_string, universal_newlines=True)
        selected_index = int(output.strip())
        if 0 <= selected_index < len(options):
            return options[selected_index]
    except subprocess.CalledProcessError:
        pass

    return None


def rofi_input(prompt):
    # Construct the Rofi command with dmenu mode and the prompt
    command = ['rofi', '-dmenu', '-p', prompt]

    # Execute the Rofi command and capture the output
    try:
        output = subprocess.check_output(command, universal_newlines=True)
        return output.strip()
    except subprocess.CalledProcessError:
        return None


def extract_metadata(path: Union[str,Path]) -> dict:
    with open(path, 'r', encoding='utf-8') as file:
        content = file.read()

    startsWithMeta = content.startswith('---')
    if not startsWithMeta:
        # raise ValueError(f"The file `{path}` does not start with a metadata block.")
        return {}

    loc = content[3:].find('---')
    metaBlock = content[3:3+loc]
    return yaml.load(metaBlock, Loader=yaml.CLoader)


def get_category(path: Path) -> Union[str,None]:
    metadata = extract_metadata(path)
    tags = metadata.get('tag')
    if (tags is not None) and ('todo' in tags):
        return path.name[:-3]


def append_to_file(path: Path, content: str):
    with open(path, 'a', encoding='utf-8') as file:
        file.write(content)
