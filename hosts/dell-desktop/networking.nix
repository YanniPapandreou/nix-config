{ config, pkgs, ... }:
{
  networking.hostName = "dell-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    # Forbid root login through SSH.
    settings = {
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
    ports = [
      33000
    ];
  };

  # vpn servers
  services.openvpn.servers = {
    imperialVPN = 
      {
        config = '' config /home/yanni/nix-config/hosts/dell-desktop/imperialVPN.conf'';
        autoStart = false;
      };
  };

}
