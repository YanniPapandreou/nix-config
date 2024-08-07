{ pkgs, ... }:
{
  programs.fish.shellAliases = {
    steel = "~/.cargo/bin/steel";
  };

  home.packages = with pkgs; [
    guile
    racket
  ];

}
