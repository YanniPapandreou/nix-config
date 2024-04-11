{ pkgs, config, ... }:

{
  xdg.configFile."lf/icons".source = ./icons;

  home.packages = with pkgs; [
    lf
    xdragon
  ];
}
