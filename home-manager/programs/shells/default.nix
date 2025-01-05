# { pkgs, ... }:
{

  imports = [
    ./bash.nix
    ./fish.nix
  ];

  # home.packages = with pkgs; [
  #   # elvish
  #   # hilbish
  #   # xonsh
  #   nushell
  #   # carapace
  # ];

  # programs.carapace = {
  #   enable = true;
  #   enableBashIntegration = false;
  #   enableFishIntegration = true;
  #   enableNushellIntegration = false;
  # };

}
