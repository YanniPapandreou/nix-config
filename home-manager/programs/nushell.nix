{ pkgs, ... }: 
{

  home.packages = with pkgs; [
    nushellFull
  ];

  # programs.nushell = {
  #   enable = true;
  #   package = pkgs.nushellFull;
  # };
}
