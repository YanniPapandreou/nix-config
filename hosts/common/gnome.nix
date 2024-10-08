{ inputs, outputs, lib, config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    #dbus.packages = [ pkgs.dconf ];
    gnome = {
      gnome-keyring.enable = true;
    };
  };

  programs.dconf.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gedit
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
    dconf-editor
    eog
    gnome-tweaks
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    arcmenu
    caffeine
    # clipboard-history
    clipboard-indicator
    # gnome-clipboard
    gnome-40-ui-improvements
    gsconnect
    media-controls
    # pano
    unblank
    vitals
    wsp-windows-search-provider
    dash-to-dock
    dash-to-panel
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
