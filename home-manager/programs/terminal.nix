{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #gnumake
    ripgrep
    htop
    tealdeer
    curl
    stow
    rm-improved
  ];

  programs = {
    bat.enable = true;
    btop = {
      enable = true;
      settings = {
        color_theme = "dracula";
	update_ms = 900;
      };
    };
    fzf = {
      enable = true;
      enableFishIntegration = false;
    };
    lazygit.enable = true;

    exa = {
      enable = true;
    };

    kitty = {
      enable = true;
      theme = "Dracula";
      font = {
        name = "FiraCode Nerd Font";
        size = 11.0;
      };
      keybindings = {
        "kitty_mod+e" = "kitten hints";
      };
      settings = {
        bold_font = "Fira Code Bold Nerd Font Complete";
        italic_font = "auto";
        bold_italic_font = "auto";
        background_opacity = "0.95";
        remember_window_size = "no";
        initial_window_width = "80c";
        initial_window_height = "24c";
        confirm_os_window_close = "0";
      };
    };

    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
