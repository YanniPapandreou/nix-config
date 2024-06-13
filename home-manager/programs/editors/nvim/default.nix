{ pkgs, ... }:
let
  fromGitHub = owner: repo: rev: hash: pkgs.vimUtils.buildVimPlugin {
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
    defaultEditor = true;

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
       nvim-spectre
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
       (fromGitHub "yujinyuz" "gitpad.nvim" "9685127c3795821bdbd3dab5a5fee4422255a102" "sha256-CAfeG38GI+E9mlltZ3nA81+6rcC+tbnTOtPZd4bBkuI=")
       (fromGitHub "ziontee113" "icon-picker.nvim" "3ee9a0ea9feeef08ae35e40c8be6a2fa2c20f2d3" "sha256-VZKsVeSmPR3AA8267Mtd5sSTZl2CAqnbgqceCptgp4w=")
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
