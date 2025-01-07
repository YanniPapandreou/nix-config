{ pkgs, ... }:
{

  imports = [
    ./common.nix
    ./atuin.nix
    ./direnv.nix
    ./glow
    ./yazi.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    csvlens
    exercism
    # ncspot
    # wiki-tui
    zellij
  ];

}
