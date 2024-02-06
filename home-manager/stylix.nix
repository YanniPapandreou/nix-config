{ pkgs, ... }:

let
  # theme = "tokyo-night-dark";
  theme = "tokyo-night-storm";
  opacity = 0.95;
  font-size = 11;
in
{
  # stylix.image = ../resources/wallpapers/nix-wallpaper-simple-dark-gray.png;
  stylix.image = ../resources/wallpapers/retro_galaxies.png;
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
  stylix.targets.kitty.enable = false;

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
      package = nerdfonts;
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

  gtk = {
    iconTheme.name = "kora";
  };
}

