# { pkgs, ... }:
{

  imports = [
    ./bash.nix
    ./fish.nix
    ./nushell
  ];

  # home.packages = with pkgs; [
  #   elvish
  #   hilbish
  #   xonsh
  # ];

}
