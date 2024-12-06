{ pkgs, lib, ... }:
{
  programs.neovim = {
    enable = true;
    # defaultEditor = true;

    extraConfig =
      # vim
      ''
        :luafile ~/.config/nvim/lua/init.lua
      '';

    withNodeJs = true;

    extraWrapperArgs = [
      "--prefix"
      "PATH"
      ":"
      "${lib.makeBinPath [ pkgs.gcc ]}"
    ];

    extraPackages = with pkgs; [
      tree-sitter
      ## Language servers
      # TODO: set this up properly
      markdown-oxide
      nodePackages.bash-language-server
      # Lua
      lua-language-server
      # Nix
      nixfmt-rfc-style
      nil
      statix
      # Python
      pyright
      # python-debug
      black
      # latex
      texlab
      # c++
      llvmPackages_14.clangNoLibc
    ];
  };

  # xdg.configFile.nvim = {
  #   source = ./config;
  #   recursive = true;
  # };

}
