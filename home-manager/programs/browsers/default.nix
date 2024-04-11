{ pkgs, ... }:
{

  # imports = [
  #   ./firefox
  # ];

  home.packages = with pkgs; [
    brave
    google-chrome
  ];

}
