{
  inputs,
  outputs,
  username,
  ...
}:
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
    # inputs.stylix.homeManagerModules.stylix
    # ../hyprland

    # You can also split up your configuration and import pieces of it here:
    # ../defaultApps.nix
    ../programs
    # ../fonts.nix
    # ../themes.nix
    # ../stylix.nix
    # ../fonts.nix
    # ../gnome.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      # outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes
      inputs.rust-overlay.overlays.default

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

  gtk = {
    enable = true;
    gtk3.bookmarks = [
      "file://${homeDirectory}/Documents"
      "file://${homeDirectory}/Music"
      "file://${homeDirectory}/Pictures"
      "file://${homeDirectory}/Videos"
      "file://${homeDirectory}/Downloads"
      "file://${homeDirectory}/nix-config Nix Config"
      "file://${homeDirectory}/projects Projects"
      "file://${homeDirectory}/.config Dotfiles"
      "file://${homeDirectory}/.local/share Local (Share)"
    ];
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 0;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 0;
    };
  };

  programs.password-store = {
    enable = true;
  };

  # Enable home-manager
  programs.home-manager.enable = true;


  # Nicely reload system units when changing configs
  systemd.user = {
    startServices = "sd-switch";
    # see comment on github issue for this
    # https://github.com/nix-community/home-manager/issues/2064#issuecomment-887300055
    targets.tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
