{ pkgs, ... }:
{
  home.packages = with pkgs; [
    choose
    cliphist
    gojq
    rofi-wayland
  ];

  xdg.configFile.rofi = {
    source = ./config;
    recursive = true;
  };
}
