{pkgs, ...}:
{

  imports = [
    ../programs/ags.nix
    ../programs/dunst
    ../programs/gammastep.nix
    # ../programs/gtklock
    ../programs/network-manager-dmenu
    ../programs/obs-studio.nix
    ../programs/rofi
    ../programs/waybar
    ../programs/swappy
    ../programs/swaylock
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  #xdg.configFile."hypr/keybind".source = ./keybind;
  home.packages = with pkgs; [
    gnome.eog
    gnome.gnome-calendar
    gnome.gnome-clocks
    gnome.gnome-disk-utility
    gnome.gnome-system-monitor
    gnome.nautilus
    grim
    hyprpicker
    hyprpaper
    killall
    libsForQt5.qt5.qtwayland
    loupe
    mpv
    nwg-displays
    polkit_gnome
    qt6.qtwayland
    slurp
    swaybg
    wlr-randr
    # xfce.thunar
    # xfce.thunar-archive-plugin
    # nwg-panel and dependencies
    # nwg-panel
    # bluez
    # gtk-layer-shell
    # gtk3
    # pulseaudio
    # playerctl
  ];
}
