{ pkgs, ... }:
{

  # Enable the GNOME Desktop Environment
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    #gnome-tour
  ]) ++ (with pkgs.gnome; [
    gnome-music
    epiphany
    geary
    totem
  ]);

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.caffeine
    gnomeExtensions.pano
  ];

  users.users.yanni.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
  ];

  users.users.sosage.packages = with pkgs; [
    gnomeExtensions.dash-to-panel
  ];

}
