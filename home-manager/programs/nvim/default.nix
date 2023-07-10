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

    # TODO: add julia to treesitter
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (p: [
        p.bash
        p.c
        p.cpp
        p.dockerfile
        p.fish
        p.lua
        p.markdown
        p.markdown_inline
        p.nix
        # p.norg
        p.python
        p.tree-sitter-lua
      ]))
      fidget-nvim
      markdown-preview-nvim
      vim-wakatime
      neorg
      neorg-telescope
      # haskell-tools-nvim
    ] ++ (with pkgs.vimExtraPlugins; [
      dracula-nvim
      lualine-nvim
      legendary-nvim
      dressing-nvim
      oil-nvim
      telescope-nvim
      plenary-nvim
      alpha-nvim

      # LSP
      nvim-lspconfig
      # Mostly for linting
      null-ls-nvim
      # LSP status window
      # fidget-nvim
      # Highlight selected symbol
      vim-illuminate
      lspsaga-nvim
      neodev-nvim

      # Completions
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp-signature-help
      nvim-cmp
      lspkind-nvim
      lspsaga-nvim

      # Snippets
      luasnip
      cmp_luasnip

      nvim-treesitter-textobjects

      nvim-autopairs
      indent-blankline-nvim

      trouble-nvim
      todo-comments-nvim
      vimtex

      gitsigns-nvim
      comment-nvim
      leap-nvim
      nvim-spectre
      which-key-nvim
      undotree
      toggleterm-nvim
      nvim-colorizer-lua
      nvim-web-devicons
      obsidian-nvim
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
