{ pkgs, ... }:
{

  home.packages = with pkgs; [
    nushell
  ];

  # programs.nushell = {
  #   enable = true;
  #   package = pkgs.nushellFull;
  #   configFile.source = ./config/config.nu;
  #   envFile.source = ./config/env.nu;
  # };
}
