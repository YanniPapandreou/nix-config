{ pkgs, ...}:
{
  programs.bash = {
    enable = true;

    bashrcExtra = ''
    export CDPATH="..:$HOME:$HOME/projects:$HOME/nix-config:$HOME/Documents"
    '';

    shellAliases = {
      ls = "exa --color=always --group-directories-first --icons";
      la = "exa -a --color=always --group-directories-first --icons";
      ll = "exa -l --color=always --group-directories-first --icons";
      lt = "exa -aT --color=always --group-directories-first --icons";
      lt1 = "exa -aT --color=always --group-directories-first --icons --level=1";
      lt2 = "exa -aT --color=always --group-directories-first --icons --level=2";
      lt3 = "exa -aT --color=always --group-directories-first --icons --level=3";
      lt4 = "exa -aT --color=always --group-directories-first --icons --level=4";
      lt5 = "exa -aT --color=always --group-directories-first --icons --level=5";
      ip = "ip -color";
      #cat = "bat --style header --style snip --style changes --style header";
      rip = "rip --graveyard ~/.local/share/Trash";
      todoist-cli = "todoist";
      gits = "git status";
      ".." = "cd ..";
      "..." = "cd ../..";
    };

  };
}
