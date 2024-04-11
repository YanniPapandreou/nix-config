{ pkgs, ... }:
let
  python-debug = pkgs.python3.withPackages (p: with p; [ debugpy ]);
in
{
  programs.neovim = {
    package = pkgs.neovim-nightly;
    enable = true;
    defaultEditor = true;

    extraConfig = ''
      :luafile ~/.config/nvim/lua/init.lua
    '';

     withNodeJs = true;
     withPython3 = true;

     plugins = with pkgs.vimPlugins; [
       # alpha-nvim
       cmp-buffer
       cmp-latex-symbols
       cmp-nvim-lsp
       cmp-nvim-lsp-signature-help
       cmp-path
       cmp_luasnip
       comment-nvim
       dracula-nvim
       fidget-nvim
       gitsigns-nvim
       lspkind-nvim
       lspsaga-nvim
       lualine-nvim
       luasnip
       markdown-preview-nvim
       mini-nvim
       neodev-nvim
       # nui-nvim
       # nvim-autopairs
       nvim-cmp
       nvim-lspconfig
       # nvim-neoclip-lua
       nvim-spectre
       nvim-treesitter-textobjects
       nvim-treesitter.withAllGrammars
       nvim-web-devicons
       # oil-nvim
       plenary-nvim
       # searchbox-nvim
       telescope-frecency-nvim
       telescope-manix
       telescope-nvim
       telescope-project-nvim
       todo-comments-nvim
       toggleterm-nvim
       trouble-nvim
       undotree
       vim-parinfer
       vim-wakatime
       vimtex
       which-key-nvim
       yuck-vim
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
       nodePackages.pyright
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
