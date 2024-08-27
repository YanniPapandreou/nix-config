{ pkgs, ... }:
{

  imports = [
    ./nvim
    ./vscode.nix
    # ./nvim_bayforest.nix
    # ./nvim_barebones.nix
    ./helix
  ];

  home.packages = with pkgs; [
    # kakoune
    taplo
    nixfmt-rfc-style
    # zed-editor
    # neovide
  ];

}
