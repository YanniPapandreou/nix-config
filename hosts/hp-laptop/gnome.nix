{ inputs, outputs, lib, config, pkgs, ... }:
{

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    #dbus.packages = [ pkgs.dconf ];
    gnome = {
      gnome-keyring.enable = true;
    };
  };

  programs.dconf.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gedit
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gnome-terminal
    geary
    epiphany
    geary
    # evince
    # totem
    tali
    iagno
    hitori
    atomix
  ]);

  # gnome extensions
  environment.systemPackages = (with pkgs; [
    eyedropper
    gnome-photos
    kora-icon-theme
    gnome.dconf-editor
    gnome.eog
    gnome.gnome-tweaks
    gnome.zenity
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    arcmenu
    caffeine
    gnome-40-ui-improvements
    gsconnect
    media-controls
    pano
    switcher
    unblank
    vitals
    wsp-windows-search-provider
    # dash-to-dock
    # dash-to-panel
    # forge
    # gsconnect
    # hide-activities-button
    # just-perfection
    # pop-shell
    # remove-app-menu
    # status-area-horizontal-spacing
    # tray-icons-reloaded
    #material-shell
  ]);


  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

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
