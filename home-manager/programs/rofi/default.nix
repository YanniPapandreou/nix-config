{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cliphist
    gojq
    rofi-wayland
  ]; 

  xdg.configFile.rofi = {
    source = ./config;
    recursive = true;
  };
}
