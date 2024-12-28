{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (lua.withPackages (ps: with ps; [ busted ]))
  ];
}
