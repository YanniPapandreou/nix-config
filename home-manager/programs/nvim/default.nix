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

     plugins = with pkgs.vimPlugins; [
       dracula-nvim
       oil-nvim
       telescope-nvim
       plenary-nvim
       which-key-nvim
       nvim-treesitter.withAllGrammars
       nvim-treesitter-textobjects
       nvim-autopairs
       comment-nvim
       nvim-lspconfig
       nvim-cmp
       cmp-nvim-lsp
       luasnip
       cmp-buffer
       cmp-path
       cmp_luasnip
       cmp-latex-symbols
       cmp-nvim-lsp-signature-help
       lspkind-nvim
       # lsp-zero-nvim
       vim-wakatime
       neodev-nvim
       lspsaga-nvim-original
       fidget-nvim
       lualine-nvim
       alpha-nvim
       gitsigns-nvim
       vim-illuminate
       indent-blankline-nvim
       leap-nvim
       neorg
       neorg-telescope
       todo-comments-nvim
       trouble-nvim
       toggleterm-nvim
       undotree
       vimtex
       nui-nvim
       searchbox-nvim
       dressing-nvim
       glow-nvim
       telescope-manix
       telescope-project-nvim
       telescope-frecency-nvim
       nvim-neoclip-lua
       nvim-spectre
       yuck-vim
       vim-parinfer
       markdown-preview-nvim
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

   xdg.configFile.nvim = {
     source = ./config;
     recursive = true;
   };
}
