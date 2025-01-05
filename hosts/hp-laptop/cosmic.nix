{ pkgs, ... }:
{
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  environment.systemPackages = with pkgs; [
    cosmic-ext-applet-clipboard-manager
    cosmic-ext-applet-emoji-selector
    cosmic-ext-applet-external-monitor-brightness
    cosmic-ext-examine
    cosmic-ext-tweaks
  ];

  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}
