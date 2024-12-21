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
    ./r
    ./rust.nix
    ./sioyek.nix
    ./scheme.nix
    # ./variables.nix
    ./xdg.nix
  ];

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    cachix
    # calibre
    # cowsay
    discord
    element-desktop
    # fragments
    gnome-boxes
    hledger
    hledger-ui
    hledger-web
    lua51Packages.lua
    lua51Packages.luarocks
    # ipe
    kdePackages.okular
    mediawriter
    pamixer
    pavucontrol
    remmina
    signal-desktop
    slack
    # texlive.combined.scheme-full
    # thunderbird
    vlc
    zotero
    zk
  ];

}
