{ config, pkgs, ... }:
{
  imports = [
    ./atuin.nix 
    ./direnv.nix
    ./firefox
    ./fish.nix
    ./nushell.nix
    ./git.nix
    ./glow
    ./nvim
    ./python.nix
    ./ranger
    ./sioyek.nix
    ./starship.nix
    ./terminal.nix
    # ./todoist.nix
    ./variables.nix
    ./xdg.nix
  ]; 

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    #dosfstools
    #exfat
    #ntfs3g
    #swaynotificationcenter
    brightnessctl
    cachix
    choose
    difftastic
    discord
    element-desktop
    exercism
    fd
    fragments
    gh
    # glib
    # gnome.eog
    gnome.gnome-tweaks
    google-chrome
    # gtg
    ipe
    neofetch
    networkmanagerapplet
    obsidian
    pamixer
    pavucontrol
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
