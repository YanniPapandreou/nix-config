{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    pamixer
    pavucontrol
    playerctl
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  xdg.configFile.waybar = {
    source = ./config; 
    recursive = true;
  };

}
