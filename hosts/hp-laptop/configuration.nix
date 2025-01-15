{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
let
  username = "yanni";
in
{

  imports = [
    ./hardware-configuration.nix
    ./audio.nix
    ./locale.nix
    ./networking.nix
    # ./steam.nix
    # ./hyprland.nix
    # ./kde.nix
    ../common/fonts.nix
    ../common/gnome.nix
    ../common/utils.nix
    # ../common/stylix.nix
    # ./cosmic.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications

      # You can also add overlays exported from other flakes
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
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      builders-use-substitutes = true;
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
      substituters = [
        "https://nix-community.cachix.org"
        # "https://cosmic.cachix.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        # "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      ];
    };

    # # Automatic garbage collection
    # gc = {
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 20d";
    # };

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # bootloader config
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
      systemd-boot.enable = true;
    };
    # encryption
  initrd.luks.devices."luks-e1f65f9b-fba1-457a-a518-37d8f126497b".device = "/dev/disk/by-uuid/e1f65f9b-fba1-457a-a518-37d8f126497b";
  };

  # services
  services = {
    flatpak.enable = true;
    printing.enable = true;
    xserver = {
      enable = true;
    };
  };

  systemd.services.configure-flathub-repo = {
    wantedBy = ["multi-user.target"];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };

  systemd.services.NetworkManager-wait-online = {
    serviceConfig = {
      ExecStart = [
        ""
        "${pkgs.networkmanager}/bin/nm-online -q"
      ];
    };
  };

  # users
  users.users = {
    ${username} = {
      isNormalUser = true;
      description = "Yanni Papandreou";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "vboxusers"
        "audio"
      ];

      shell = pkgs.fish;
      # shell = pkgs.nushell;
    };
  };

  # enable home-manager to be build when running sudo nixos-rebuild --switch...
  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs username;
    };
    users = {
      # Import your home-manager configuration
      ${username} = import ../../home-manager/${username};
    };
    backupFileExtension = "hm-backup";
  };

  # packages and programs
  environment.systemPackages = with pkgs; [
    nil
    nix-output-monitor
    nixfmt-rfc-style
    nvd
    openssl
    pkg-config
    vim
  ];

  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "kitty";
    STEEL_HOME = "/home/yanni/.steel";
    PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";
    NVIM_APPNAME = "y-nvim";
    ZK_NOTEBOOK_DIR = "/home/yanni/notes";
  };
  programs.fish.enable = true;
  virtualisation.docker.enable = true;

  # hardware
  hardware.bluetooth.enable = true;

  virtualisation.virtualbox.host.enable = true;
  # virtualisation.vmware.host.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.kvmgt.enable = true;
  users.extraUsers.yanni.extraGroups = [ "kvm" ];
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  #system.stateVersion = "23.05";
  system.stateVersion = "23.11";
}
