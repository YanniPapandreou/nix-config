{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # swaynotificationcenter
    # brightnessctl
    networkmanagerapplet
    pamixer
    pavucontrol
  ];
}
