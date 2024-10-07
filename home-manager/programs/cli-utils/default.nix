{ pkgs, ... }:
{

  imports = [
    ./common.nix
    ./atuin.nix
    ./direnv.nix
    ./exercism.nix
    ./glow
    ./yazi.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    zellij
  ];

}
