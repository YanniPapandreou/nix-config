{ pkgs, ... }:
let
  nerdfonts = (pkgs.nerdfonts.override { fonts = [
    "CascadiaCode"
    "FantasqueSansMono"
    "FiraCode"
    "Mononoki"
    "Noto"
    "Ubuntu"
    "UbuntuMono"
  ]; });
in
{
  # to allow configuring fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    carlito
    corefonts
    font-awesome
    gnome-icon-theme
    hicolor-icon-theme
    jetbrains-mono
    source-code-pro
    nerdfonts
  ];
}
