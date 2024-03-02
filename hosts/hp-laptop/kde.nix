{ inputs, outputs, lib, config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
  # services.xserver.desktopManager.plasma6.enableQt5Integration = false;

  # services.xserver.displayManager.defaultSession = "plasmawayland";
  # services.xserver.displayManager.defaultSession = "plasma";
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    # libsForQt5.plasma-browser-integration
    kdePackages.plasma-browser-integration
  ];

  # programs.kdeconnect.enable = true;
}
