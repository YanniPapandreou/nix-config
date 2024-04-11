{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #gnumake
    ripgrep
    htop
    tealdeer
    curl
    stow
    rm-improved
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "Dracula";
      };
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep ];
    };
    btop = {
      enable = true;
      settings = {
        # color_theme = "dracula";
        update_ms = 900;
      };
    };
    fzf = {
      enable = true;
      # enableFishIntegration = false;
      # package = pkgs.fzf.overrideAttrs (final: prev: {
      #     postInstall = (prev.postInstall or "") + ''
      #       cat << EOF > $out/share/fish/vendor_conf.d/load-fzf-key-bindings.fish
      #         status is-interactive; or exit 0
      #         fzf_key_bindings
      #       EOF
      #     '';
      # });
    };
    lazygit.enable = true;

    eza = {
      enable = true;
    };

    kitty = {
      enable = true;
      theme = "Dracula";
      font = {
        name = "FiraCode Nerd Font";
        size = 11.0;
      };
      keybindings = {
        "kitty_mod+e" = "kitten hints";
        # "ctrl+shift+enter" = "no_op";
        # "shift+enter" = "send_text all \x1b[13;2u";
        # "ctrl+enter" = "send_text all \x1b[13;5u";
      };
      settings = {
        bold_font = "Fira Code Bold Nerd Font Complete";
        italic_font = "auto";
        bold_italic_font = "auto";
        background_opacity = "0.95";
        remember_window_size = "no";
        initial_window_width = "80c";
        initial_window_height = "24c";
        confirm_os_window_close = "0";
        # hide_window_decorations = "yes";
        wayland_titlebar_color = "#21232D";
      };
    };

    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
