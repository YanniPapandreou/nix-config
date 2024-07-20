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
    taplo
    # zed-editor
    # neovide
  ];

}
