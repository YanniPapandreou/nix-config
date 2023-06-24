{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
    pamixer
    pavucontrol
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  };

  xdg.configFile.waybar = {
    source = ./config; 
    recursive = true;
  };

}
