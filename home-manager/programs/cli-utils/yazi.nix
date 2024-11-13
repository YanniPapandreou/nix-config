{ config, pkgs, lib, ... }:
let
  # fetch the TOML file from github
  catppuccinToml = builtins.fetchurl {
    # url = "https://raw.githubusercontent.com/catppuccin/yazi/refs/heads/main/themes/mocha.toml";
    url = "https://raw.githubusercontent.com/catppuccin/yazi/refs/heads/main/themes/mocha/catppuccin-mocha-lavender.toml";
    sha256 = "sha256:0q5s628jxggila847dfxzw7mskazc1gr5gpzrqpl260cly4aqp0c";
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
