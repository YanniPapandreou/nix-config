{ pkgs, ... }:

let
  # theme = "tokyo-night-dark";
  # theme = "tokyo-night-storm";
  # theme = "oxocarbon-dark";
  # theme = "dracula";
  theme = "catppuccin-mocha";
  opacity = 0.95;
  font-size = 12;
in
{
  stylix.enable = true;
  stylix.image = ../../resources/wallpapers/nix-wallpaper-simple-dark-gray.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

  stylix.opacity = {
    terminal = opacity;
    popups = opacity;
  };

  stylix.cursor = with pkgs; {
    package = phinger-cursors;
    name = "phinger-cursors-light";
    size = 24;
  };

  stylix.fonts = with pkgs; {
    serif = {
      package = noto-fonts-cjk-sans;
      name = "Noto Sans CJK JP";
    };

    sansSerif = {
      package = noto-fonts-cjk-sans;
      name = "Noto Sans CJK JP";
    };

    monospace = {
      package = nerd-fonts.fira-code;
      name = "FiraCode Nerd Font Mono";
    };

    emoji = {
      package = noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    sizes = {
      applications = font-size;
      desktop = font-size;
      popups = font-size;
      terminal = font-size;
    };
  };
}

