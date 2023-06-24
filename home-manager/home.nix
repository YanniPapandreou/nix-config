# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default ./hyprland/hyprland.nix

    # You can also split up your configuration and import pieces of it here:
    ./atuin.nix
    # ./defaultApps.nix
    ./firefox.nix
    ./fish.nix
    ./fonts.nix
    ./git.nix
    ./nvim
    ./python.nix
    ./sioyek.nix
    ./starship.nix
    ./terminal.nix
    ./themes.nix
    ./todoist.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      inputs.neovim-nightly-overlay.overlay
      inputs.nixneovimplugins.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "yanni";
    homeDirectory = "/home/yanni";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    #dosfstools
    #exfat
    #ntfs3g
    brightnessctl
    cachix
    choose
    cliphist
    difftastic
    discord
    gh
    gtg
    fd
    gnome.eog
    gnome.nautilus
    gojq
    google-chrome
    ipe
    kitty
    neofetch
    networkmanager_dmenu
    networkmanagerapplet
    pamixer
    pavucontrol
    ranger
    ripgrep
    rofi-wayland
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

  # Enable home-manager
  programs.home-manager.enable = true;

  services.network-manager-applet.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  programs.password-store = {
    enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
