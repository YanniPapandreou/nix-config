{ pkgs, ... }:
{
  home.packages = with pkgs; [
    networkmanager_dmenu
  ];

  xdg.configFile."networkmanager-dmenu" = {
    source = ./config;
    recursive = true;
  };
}
