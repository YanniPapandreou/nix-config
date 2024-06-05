{ config, pkgs, lib, ... }:
let
  # python-debug = pkgs.python3.withPackages (p: with p; [ debugpy ]);
  fromGitHub = rev: ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
      rev = rev;
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
       # (fromGitHub "43bbefd410333a04baf62ddfa8bb2a2d30a1bbc1" "main" "MeanderingProgrammer/markdown.nvim")
       (fromGitHub "9685127c3795821bdbd3dab5a5fee4422255a102" "main" "yujinyuz/gitpad.nvim")
       # (fromGitHub "087bbcfce3a7e3e9c4defa420493132bbdd16499" "main" "carbon-steel/detour.nvim")
       # (fromGitHub "c0ec78ef10ba01ab841b3e870421c33b1bbd6292" "main" "milanglacier/yarepl.nvim")
       # (fromGitHub "70703d6ce1da56a07c50ad2dadc894410b9ebe34" "harpoon2" "ThePrimeagen/harpoon")
       # (fromGitHub "7a73c055cd405a72606509172a3cd35fbb91bbe9" "main" "mnowotnik/noteflow.nvim")
       (fromGitHub "3ee9a0ea9feeef08ae35e40c8be6a2fa2c20f2d3" "master" "ziontee113/icon-picker.nvim")
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
