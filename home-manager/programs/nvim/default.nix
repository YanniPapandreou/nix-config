{ pkgs, ... }:
let
  python-debug = pkgs.python3.withPackages (p: with p; [ debugpy ]);
in
{
  programs.neovim = {
    package = pkgs.neovim-nightly;
    enable = true;
    defaultEditor = true;

    extraConfig =
    # vim
    ''
      :luafile ~/.config/nvim/lua/init.lua
    '';

     withNodeJs = true;

     plugins = with pkgs.vimPlugins; [
       cmp-buffer
       cmp-latex-symbols
       cmp-nvim-lsp
       cmp-nvim-lsp-signature-help
       cmp-path
       cmp_luasnip
       comment-nvim
       dracula-nvim
       dressing-nvim
       fidget-nvim
       gitsigns-nvim
       glow-nvim
       hmts-nvim
       lspkind-nvim
       lspsaga-nvim
       luasnip
       markdown-preview-nvim
       mini-nvim
       neodev-nvim
       nui-nvim
       nvim-cmp
       nvim-lspconfig
       nvim-spectre
       nvim-treesitter-textobjects
       nvim-treesitter.withAllGrammars
       nvim-web-devicons
       plenary-nvim
       searchbox-nvim
       telescope-frecency-nvim
       telescope-manix
       telescope-nvim
       telescope-project-nvim
       todo-comments-nvim
       toggleterm-nvim
       trouble-nvim
       undotree
       vim-wakatime
       vimtex
       which-key-nvim
     ] ++ (with pkgs.vimExtraPlugins; [
       lsp-zero-nvim
       nvim-colorizer-lua
       obsidian-nvim
       icon-picker-nvim
     ]);

     extraPackages = with pkgs; [
       tree-sitter
       ## Language servers
       nodePackages.bash-language-server
       # Lua
       # TODO: switch to unstable nixpkgs and use this
       lua-language-server
       # Nix
       rnix-lsp
       nixpkgs-fmt
       statix
       # Python
       pyright
       python-debug
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
