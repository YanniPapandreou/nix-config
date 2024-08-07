{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      zoxide init fish | source
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
    };

    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "46c7bc6354494be5d869d56a24a46823a9fdded0";
          sha256 = "lxQZo6APemNjt2c21IL7+uY3YVs81nuaRUL7NDMcB6s=";
        };
      }

      {
        name = "autopair-fish";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
          sha256 = "qt3t1iKRRNuiLWiVoiAYOu+9E7jsyECyIqZJ/oRIT1A=";
        };
      }
    ];

    shellInit = ''
      # fzf_configure_bindings
      set -gx CDPATH $CDPATH ../ /home/yanni/projects /home/yanni/nix-config/ /home/yanni/.config/ /home/yanni/Documents/
    '';

    functions = {
      # flakify = ''
      #   function flakify
      #     if test ! -e flake.nix
      #       nix flake new -t "github:numtide/devshell" .
      #     end
      #   end
      # '';
    };
  };
}
