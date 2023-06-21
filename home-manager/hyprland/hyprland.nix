{pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  # notification manager
  services.dunst = {
    enable = true;
    configFile = ./dunst/dunstrc;
  };

  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 51.5;
    longitude = -0.1;
    # Set the time interval of dawn manually. The times must be specified as HH:MM in 24-hour format.
    #dawnTime = "6:00-7:45";
    # Set the time interval of dusk manually. The times must be specified as HH:MM in 24-hour format.
    # duskTime = "18:35-20:15";
    temperature = {
      # bw 1000-25000K
      day = 6500; 
      night = 3700; 
    };
    tray = true;
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      obs-studio-plugins.wlrobs 
    ];
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  };

  #xdg.configFile."hypr/keybind".source = ./keybind;
  home.packages = with pkgs; [
    grim
    gtklock
    libsForQt5.qt5.qtwayland
    mpv
    polkit_gnome
    qt6.qtwayland
    slurp
    swappy
    swaybg
  ];
}
