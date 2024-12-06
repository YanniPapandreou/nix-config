{ pkgs, ... }:
{

  imports = [
    ./vscode.nix
    ./helix
    ./nvim
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
