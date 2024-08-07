{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #gnumake
    # cliphist
    bootdev
    curl
    difftastic
    fd
    gh
    htop
    just
    marksman
    markdown-oxide
    manix
    nb
    neofetch
    pfetch
    ripgrep
    rm-improved
    stow
    tealdeer
    wl-clipboard
    xdg-utils
    xplr
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "Dracula";
      };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
      ];
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
      enableNushellIntegration = false;
    };
  };
  home.file.".config/starship.toml".source = ./starship.toml;
}
