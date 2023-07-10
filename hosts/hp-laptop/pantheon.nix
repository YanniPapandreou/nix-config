{ inputs, outputs, lib, config, pkgs, ... }:
{
  services.xserver.desktopManager.pantheon.enable = true;
}
