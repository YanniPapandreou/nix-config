{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gtklock
  ];

  xdg.configFile.gtklock = {
    source = ./config;
    recursive = true;
  }; 
}
