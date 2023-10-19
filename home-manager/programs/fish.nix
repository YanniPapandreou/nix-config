{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
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
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      # { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      # Manually packaging and enable a plugin
    {
      name = "z";
      src = pkgs.fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
        # rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
        rev = "85f863f20f24faf675827fb00f3a4e15c7838d76";
        # sha256 = "0000000000000000000000000000000000000000000000000000";
        sha256 = "+FUBM7CodtZrYKqU542fQD+ZDGrd2438trKM0tIESs0=";
      };
    }

    {
      name = "fzf-fish";
      src = pkgs.fetchFromGitHub {
        owner = "PatrickF1";
        repo = "fzf.fish";
        rev = "63c8f8e65761295da51029c5b6c9e601571837a1";
        sha256 = "i9FcuQdmNlJnMWQp7myF3N0tMD/2I0CaMs/PlD8o1gw=";
      };
    }

    {
      name = "sponge";
      src = pkgs.fetchFromGitHub {
        owner = "meaningful-ooo";
        repo = "sponge";
        rev = "384299545104d5256648cee9d8b117aaa9a6d7be";
        sha256 = "MdcZUDRtNJdiyo2l9o5ma7nAX84xEJbGFhAVhK+Zm1w=";
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

    {
      name = "spark-fish";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "spark.fish";
        rev = "90a60573ec8a8ecb741a861e0bfca2362f297e5f";
        sha256 = "cRSZeqtXSaEKuHeTSk3Kpmwf98mKJ986x1KSxa/HggU=";
      };
    }
   # {
   #   name = "fish-fzf-todoist";
   #   src = pkgs.fetchFromGitHub {
   #     owner = "mordax7";
	#repo="fish-fzf-todoist";
	#rev = "0823b8250697d25b0b6b8a50b02eb63817a3b9c5";
        #sha256 = "o2mAx9GfuPpYszS3+sLljP7XCJv9rrHG7uzNbJ5x5mE=";
      #};
    #}
    ];

    shellInit = ''
      fzf_configure_bindings
      set -gx CDPATH $CDPATH ../ /home/yanni/projects /home/yanni/nix-config/ /home/yanni/Documents/
      '';
  };
}
