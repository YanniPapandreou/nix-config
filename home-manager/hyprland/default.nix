{pkgs, ...}:
{

  imports = [
    ../programs/dunst
    ../programs/gammastep.nix
    ../programs/gtklock
    ../programs/network-manager-dmenu
    ../programs/obs-studio.nix
    ../programs/rofi
    ../programs/waybar
    ../programs/swappy
    # ../programs/eww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  #xdg.configFile."hypr/keybind".source = ./keybind;
  home.packages = with pkgs; [
    eww-wayland
    gnome.eog
    gnome.gnome-disk-utility
    gnome.nautilus
    grim
    libsForQt5.qt5.qtwayland
    mpv
    polkit_gnome
    qt6.qtwayland
    slurp
    swaybg
  ];
}
