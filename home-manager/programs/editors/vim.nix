{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-colorschemes
    ];
    # extraConfig = ''
    # '';
  };
}
