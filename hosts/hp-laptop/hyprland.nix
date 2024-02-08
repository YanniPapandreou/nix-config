{ inputs, pkgs, ... }:
let
  ags = inputs.ags.packages.${pkgs.system}.ags;
in
{

  programs.hyprland.enable = true;
  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services = {
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    accounts-daemon.enable = true;
    gnome = {
      evolution-data-server.enable = true;
      glib-networking.enable = true;
      gnome-online-accounts.enable = true;
      gnome-keyring.enable = true;
      sushi.enable = true;
    };
    xserver.displayManager.gdm.enable = true;
  };
  programs.seahorse.enable = true;

  security = {
    polkit.enable = true;
    pam.services.swaylock = {};
    # TODO: when using ags uncomment this if necessary
    # pam.services.ags = {};
  };

  environment.systemPackages = with pkgs; [
      ags
      kora-icon-theme
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

}
