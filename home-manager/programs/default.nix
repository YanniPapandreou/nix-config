{ config, pkgs, ... }:
{
  imports = [
    ./atuin.nix
    ./bash.nix
    ./direnv.nix
    # ./firefox
    ./fish.nix
    ./nushell
    ./git.nix
    ./glow
    ./lf
    ./nvim
    # ./nvim_bayforest.nix
    # ./nvim_barebones.nix
    ./python.nix
    ./ranger
    ./rofi
    ./sioyek.nix
    ./starship.nix
    ./terminal.nix
    # ./todoist.nix
    ./variables.nix
    # ./vim.nix
    ./vscode.nix
    ./xdg.nix
    ./zoxide.nix
    ./zellij.nix
  ];

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    #dosfstools
    #exfat
    #ntfs3g
    #swaynotificationcenter
    brightnessctl
    brave
    cachix
    calibre
    choose
    difftastic
    discord
    element-desktop
    elvish
    exercism
    fd
    fragments
    # frogmouth
    gh
    # glib
    # gnome.eog
    gnome.gnome-boxes
    # gnome.gnome-tweaks
    google-chrome
    # gtg
    helix
    hilbish
    hledger
    hledger-ui
    hledger-web
    ipe
    just
    # mailspring
    manix
    marksman
    nb
    neofetch
    neovide
    networkmanagerapplet
    # obsidian
    pamixer
    pavucontrol
    pfetch
    remmina
    ripgrep
    signal-desktop
    slack
    stow
    # texlive.combined.scheme-full
    thunderbird
    vlc
    # warp-terminal
    wl-clipboard
    xdg-utils
    xonsh
    zola
    zotero
  ];

}
