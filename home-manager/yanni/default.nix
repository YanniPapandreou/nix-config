{ inputs, outputs, username, ... }:
let
  homeDirectory = "/home/${username}";
in
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default
    ../hyprland

    # You can also split up your configuration and import pieces of it here:
    ../defaultApps.nix
    ../programs
    ../themes.nix
    # ../stylix.nix
    # ../fonts.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      # outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      inputs.neovim-nightly-overlay.overlay
      inputs.nixneovimplugins.overlays.default
      # inputs.neorg-overlay.overlays.default

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
    # NOTE: I think this means `userame = username;` (and same for `homeDirectory`)
    inherit username homeDirectory;

    # extra directories to add to path
    # sessionPath = [];
  };

  news.display = "show";

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  gtk.gtk3.bookmarks = [
    "file://${homeDirectory}/Documents"
    "file://${homeDirectory}/Music"
    "file://${homeDirectory}/Pictures"
    "file://${homeDirectory}/Videos"
    "file://${homeDirectory}/Downloads"
    "file://${homeDirectory}/Desktop"
    "file://${homeDirectory}/Projects"
    "file://${homeDirectory}/.config Config"
    "file://${homeDirectory}/.local/share Local"
  ];

  programs.password-store = {
    enable = true;
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  services.network-manager-applet.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
