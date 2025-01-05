{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #gnumake
    # bootdev
    curl
    difftastic
    fd
    gh
    gojq
    htop
    just
    marksman
    # markdown-oxide
    manix
    nb
    # neofetch
    # pfetch
    ripgrep
    rm-improved
    stow
    # taskwarrior3
    # taskwarrior-tui
    tealdeer
    todoist
    wl-clipboard
    # wthrr
    xdg-utils
    # xdragon
    yaml-language-server
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "catppuccin-mocha";
      };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
      ];
      themes = {
        catppuccin-mocha = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "d3feec47b16a8e99eabb34cdfbaa115541d374fc";
            sha256 = "sha256-s0CHTihXlBMCKmbBBb8dUhfgOOQu9PBCQ+uviy7o47w=";
          };
          file = "themes/Catppuccin Mocha.tmTheme";
        };
      };
    };
    btop = {
      enable = true;
      settings = {
        color_theme = "dracula";
        update_ms = 900;
      };
    };
    eza = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
    lazygit.enable = true;
    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };
  };
  home.file.".config/starship.toml".source = ./starship.toml;
}
