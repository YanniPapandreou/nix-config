{ pkgs, lib, inputs, ... }:
{
  home.packages = with pkgs; [
    stylua
    nixfmt-rfc-style
    shfmt
  ];

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
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
      nodePackages.bash-language-server
      # Lua
      lua-language-server
      # Nix
      nil
      statix
      # Python
      pyright
      # python-debug
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
