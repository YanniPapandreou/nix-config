{ config, pkgs, lib, ... }:
let
  python-debug = pkgs.python3.withPackages (p: with p; [ debugpy ]);
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
       neogit
       nui-nvim
       nvim-cmp
       nvim-lspconfig
       # nvim-nu
       nvim-spectre
       nvim-treesitter-textobjects
       nvim-treesitter.withAllGrammars
       nvim-web-devicons
       # null-ls-nvim
       plenary-nvim
       searchbox-nvim
       telescope-frecency-nvim
       telescope-manix
       telescope-nvim
       telescope-project-nvim
       todo-comments-nvim
       toggleterm-nvim
       tokyonight-nvim
       trouble-nvim
       undotree
       vim-wakatime
       vimtex
       which-key-nvim
       (fromGitHub "087bbcfce3a7e3e9c4defa420493132bbdd16499" "main" "carbon-steel/detour.nvim")
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
