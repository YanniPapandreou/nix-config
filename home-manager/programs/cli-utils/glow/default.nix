{ pkgs, ... }:
{
  home.packages = with pkgs; [
    glow
  ];

  xdg.configFile.glow = {
    source = ./config;
    recursive = true;
  };

}
