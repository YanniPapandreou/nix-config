{ config, pkgs, ... }:
{
  imports = [
    ./atuin.nix 
    ./bash.nix
    ./direnv.nix
    ./firefox
    ./fish.nix
    ./nushell
    ./git.nix
    ./glow
    ./lf.nix
    ./nvim
    # ./nvim_bayforest.nix
    # ./nvim_barebones.nix
    ./python.nix
    ./ranger
    ./sioyek.nix
    ./starship.nix
    ./terminal.nix
    # ./todoist.nix
    ./variables.nix
    # ./vim.nix
    # ./vscode.nix
    ./xdg.nix
    ./zoxide.nix
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
    frogmouth
    gh
    # glib
    # gnome.eog
    gnome.gnome-tweaks
    google-chrome
    # gtg
    helix
    hledger
    hledger-ui
    hledger-web
    ipe
    just
    # mailspring
    manix
    marksman
    neofetch
    networkmanagerapplet
    obsidian
    pamixer
    pavucontrol
    remmina
    ripgrep
    signal-desktop
    slack
    stow
    tectonic
    texlive.combined.scheme-full
    texlab
    thunderbird
    vlc
    wl-clipboard
    xdg-utils
    zotero
  ];

}
