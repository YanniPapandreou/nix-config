{ inputs, outputs, lib, config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs.dconf.enable = true;
  # services.dbus.packages = [ pkgs.dconf ]; 

  # environment.gnome.excludePackages = (with pkgs; [
  #   gnome-photos
  #   gnome-tour
  # ]) ++ (with pkgs.gnome; [
  #   gnome-music
  #   gnome-terminal
  #   gedit
  #   epiphany
  #   geary
  #   evince
  #   totem
  #   tali
  #   iagno
  #   hitori
  #   atomix
  # ]);

  # gnome extensions
  environment.systemPackages = (with pkgs; [
    eyedropper
    kora-icon-theme
    gnome.dconf-editor
    gnome.gnome-tweaks
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    arcmenu
    caffeine
    # dash-to-dock
    # dash-to-panel
    # forge
    gnome-40-ui-improvements
    # gsconnect
    # hide-activities-button
    # just-perfection
    #material-shell
    pano
    # pop-shell
    # remove-app-menu
    # status-area-horizontal-spacing
    # switcher
    # tray-icons-reloaded
    vitals
  ]);

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # xdg.portal.wlr.enable = true;

  # xdg = {
  #   portal = {
  #     enable = true;
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-wlr
  #         xdg-desktop-portal-gtk
  #     ];
  #   };
  # };

}
