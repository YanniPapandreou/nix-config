{ config, pkgs, lib, ... }:
let
  # fetch the TOML file from github
  catppuccinToml = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/yazi/refs/heads/main/themes/mocha.toml";
    sha256 = "sha256:0bhccaf3m3mhhqwfxhwds1rhb228pxj014mrd5hm7ys52jkqljxb";
  };

  # read and parse the TOML file
  catppuccinTomlContent = builtins.readFile catppuccinToml;
  catppuccinParsedToml = builtins.fromTOML catppuccinTomlContent;
in
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    theme = catppuccinParsedToml;
  };

}
