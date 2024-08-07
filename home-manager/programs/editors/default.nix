{ pkgs, ... }:
{

  imports = [
    ./nvim
    ./vscode.nix
    # ./nvim_bayforest.nix
    # ./nvim_barebones.nix
  ];

  home.packages = with pkgs; [
    helix
    # kakoune
    taplo
    nixfmt-rfc-style
    # zed-editor
    # neovide
  ];

}
