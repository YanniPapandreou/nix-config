{ config, pkgs, ... }:
{
  imports = [
    ./browsers
    ./cli-utils
    ./editors
    ./shells
    ./terminals
    ./git.nix
    ./mailspring.nix
    ./python.nix
    ./r.nix
    ./sioyek.nix
    ./variables.nix
    ./xdg.nix
  ];

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    cachix
    # calibre
    discord
    element-desktop
    # fragments
    gnome.gnome-boxes
    hledger
    hledger-ui
    hledger-web
    leafpad
    # ipe
    pamixer
    pavucontrol
    remmina
    signal-desktop
    slack
    # texlive.combined.scheme-full
    thunderbird
    vlc
    zotero
  ];

}
