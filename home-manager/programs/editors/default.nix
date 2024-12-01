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
    emacs
    zed-editor
    # neovide
  ];

}
