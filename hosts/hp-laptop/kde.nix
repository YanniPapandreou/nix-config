{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{

  services = {
    xserver = {
      enable = true;
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
    gnome = {
      gnome-keyring.enable = true;
    };
  };

  # services.xserver.desktopManager.plasma6.enableQt5Integration = false;

  # services.xserver.displayManager.defaultSession = "plasmawayland";
  # services.xserver.displayManager.defaultSession = "plasma";
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    libsecret
    # libsForQt5.plasma-browser-integration
    # kdePackages.akonadi
    # kdePackages.akonadi-mime
    # kdePackages.akonadi-notes
    # kdePackages.akonadiconsole
    # kdePackages.akonadi-search
    # kdePackages.akonadi-contacts
    # kdePackages.akonadi-calendar
    # kdePackages.akonadi-import-wizard
    # kdePackages.akonadi-calendar-tools
    # kdePackages.kdepim-addons
    # kdePackages.kdepim-runtime
    # kdePackages.korganizer
    # kdePackages.kmail
    # kdePackages.kmailtransport
    # kdePackages.kmail-account-wizard
    kdePackages.kweather
    # kdePackages.neochat
    kdePackages.plasma-browser-integration
    # kdePackages.yakuake
  ];

  programs.chromium = {
    enable = true;
    enablePlasmaBrowserIntegration = true;
    # plasmaBrowserIntegrationPackage = pkgs.kdePackages.plasma-browser-integration;
  };

  programs.kdeconnect.enable = true;

}
