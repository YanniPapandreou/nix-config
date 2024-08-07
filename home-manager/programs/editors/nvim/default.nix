{ pkgs, ... }:
let
  fromGitHub =
    owner: repo: rev: hash:
    pkgs.vimUtils.buildVimPlugin {
      name = repo;
      src = pkgs.fetchFromGitHub {
        owner = owner;
        repo = repo;
        rev = rev;
        hash = hash;
      };
    };
in
{
  programs.neovim = {
    package = pkgs.neovim;
    enable = true;
    # defaultEditor = true;

    extraConfig =
      # vim
      ''
        :luafile ~/.config/nvim/lua/init.lua
      '';

    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      FixCursorHold-nvim
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
      # hmts-nvim
      lspkind-nvim
      lspsaga-nvim
      lsp-zero-nvim
      luasnip
      markdown-preview-nvim
      mini-nvim
      neodev-nvim
      neogit
      neotest
      neotest-python
      nui-nvim
      nvim-cmp
      nvim-colorizer-lua
      nvim-dap
      nvim-dap-python
      nvim-dap-ui
      nvim-dap-virtual-text
      nvim-lspconfig
      # nvim-spectre
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      obsidian-nvim
      oil-nvim
      otter-nvim
      oxocarbon-nvim
      plenary-nvim
      quarto-nvim
      # searchbox-nvim
      telescope-frecency-nvim
      telescope-manix
      telescope-nvim
      telescope-project-nvim
      todo-comments-nvim
      toggleterm-nvim
      tokyonight-nvim
      trouble-nvim
      undotree
      vim-beancount
      vim-fugitive
      vim-nix
      vim-wakatime
      vimwiki
      vimtex
      which-key-nvim
      (fromGitHub "yujinyuz" "gitpad.nvim" "9685127c3795821bdbd3dab5a5fee4422255a102"
        "sha256-CAfeG38GI+E9mlltZ3nA81+6rcC+tbnTOtPZd4bBkuI="
      )
      (fromGitHub "ziontee113" "icon-picker.nvim" "3ee9a0ea9feeef08ae35e40c8be6a2fa2c20f2d3"
        "sha256-VZKsVeSmPR3AA8267Mtd5sSTZl2CAqnbgqceCptgp4w="
      )
      (fromGitHub "nvim-pack" "nvim-spectre" "49fae98ef2bfa8342522b337892992e3495065d5"
        "sha256-9rXyyy5J8YwXYioj8Rx6NGmaevb63/SE9dIxVnt38gg="
      )
      # (fromGitHub "R-nvim" "R.nvim" "d13c230503204f52094d95bb6f42992e71cf4e70" "sha256-1+o3Iga7oXT98G1CWaPiOCCWlY5/yjJBgd4kUwbSd+w=")
      # (fromGitHub "R-nvim" "cmp-r" "18b88eeb7e47996623b9aa0a763677ac00a16221" "sha256-3h+7q/x5xST50b9MdjR+9JULTwgn6kAyyrL5qhCtta0=")
    ];

    extraPackages = with pkgs; [
      tree-sitter
      ## Language servers
      marksman
      nodePackages.bash-language-server
      # Lua
      # TODO: switch to unstable nixpkgs and use this
      lua-language-server
      # Nix
      nixpkgs-fmt
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

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
