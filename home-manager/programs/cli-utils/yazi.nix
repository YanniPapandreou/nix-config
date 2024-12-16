{ config, pkgs, lib, ... }:
let
  # fetch the TOML file from github
  catppuccinToml = builtins.fetchurl {
    # url = "https://raw.githubusercontent.com/catppuccin/yazi/refs/heads/main/themes/mocha.toml";
    url = "https://raw.githubusercontent.com/catppuccin/yazi/refs/heads/main/themes/mocha/catppuccin-mocha-lavender.toml";
    sha256 = "sha256:1qnq7im1kpim8nlzy313zns4m23knkh7pwlnnfcq8vvsm598gbz3";
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
