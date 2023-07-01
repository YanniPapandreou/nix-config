{ config, pkgs, ... }:
{
  imports = [
    ./atuin.nix 
    ./direnv.nix
    ./firefox
    ./fish.nix
    ./git.nix
    ./nvim
    ./python.nix
    ./ranger
    ./sioyek.nix
    ./starship.nix
    ./terminal.nix
    ./todoist.nix
    ./variables.nix
  ]; 

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    #dosfstools
    #exfat
    #ntfs3g
    #swaynotificationcenter
    cachix
    choose
    difftastic
    discord
    fd
    fragments
    gh
    gnome.eog
    gnome.gnome-disk-utility
    gnome.nautilus
    google-chrome
    gtg
    ipe
    kitty
    neofetch
    networkmanagerapplet
    obsidian
    ripgrep
    signal-desktop
    slack
    stow
    texlive.combined.scheme-full
    thunderbird
    vlc
    wl-clipboard
    xdg-utils
    zotero
  ];

}
