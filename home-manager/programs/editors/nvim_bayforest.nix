{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nodePackages.pyright
      (neovim.override {
       configure = {
       customRC = ''
       :luafile ~/.config/nvim/lua/init.lua
       '';
       packages.myPlugins = with pkgs.vimPlugins; {
       start = [
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
         lsp-zero-nvim
         lspkind-nvim
         lspsaga-nvim
         lualine-nvim
         luasnip
         markdown-preview-nvim
         mini-nvim
         nvim-cmp
         nvim-lspconfig
         # nvim-spectre
         nvim-treesitter-textobjects
         nvim-web-devicons
         oil-nvim
         plenary-nvim
         telescope-nvim
         todo-comments-nvim
         toggleterm-nvim
         trouble-nvim
         undotree
         which-key-nvim
         (nvim-treesitter.withPlugins (
                                       plugins: with plugins; [
                                       bash
                                       c
                                       cpp
                                       fish
                                       json
                                       json5
                                       julia
                                       latex
                                       lua
                                       make
                                       markdown
                                       markdown_inline
                                       nix
                                       python
                                       rust
                                       sql
                                       toml
                                       yaml
                                       ]
           ))
         ];
       };
     };
    })
  ];
}

