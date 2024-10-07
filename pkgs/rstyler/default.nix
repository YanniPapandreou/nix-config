{ pkgs }:
let
  r-script-path = ./styler_cli.R;
in
pkgs.writeShellScriptBin "rstyler" ''
  R_SCRIPT_PATH="${r-script-path}"

  # Check if a file is provided as an argument
  if [ $# -eq 1 ]; then
    cat "$1" | Rscript "$R_SCRIPT_PATH"
  else
    Rscript "$R_SCRIPT_PATH"
  fi
''
