{ pkgs, ... }:
{

  imports = [
    ./vscode.nix
    ./helix
  ];

  home.packages = with pkgs; [
    kakoune
    taplo
    nixfmt-rfc-style
    # zed-editor
    # neovide
  ];

}
