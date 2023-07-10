{pkgs, ...}:
{

  imports = [
    ./dunst
    ./gammastep.nix
    ./gtklock
    ./network-manager-dmenu
    ./obs-studio.nix
    ./rofi
    ./waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  #xdg.configFile."hypr/keybind".source = ./keybind;
  home.packages = with pkgs; [
    gnome.eog
    gnome.gnome-disk-utility
    gnome.nautilus
    grim
    libsForQt5.qt5.qtwayland
    mpv
    polkit_gnome
    qt6.qtwayland
    slurp
    swappy
    swaybg
  ];
}
