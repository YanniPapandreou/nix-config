{pkgs, ... }:
{

  programs = {
    kitty = {
      enable = true;
      themeFile = "Catppuccin-Mocha";
      font = {
        name = "FiraCode Nerd Font";
        size = 11.0;
      };
      keybindings = {
        "kitty_mod+e" = "kitten hints";
        # "ctrl+shift+enter" = "no_op";
        # "shift+enter" = "send_text all \x1b[13;2u";
        # "ctrl+enter" = "send_text all \x1b[13;5u";
        "f5" = "launch --location=hsplit";
        "f6" = "launch --location=vsplit";
        "f4" = "launch --location=split";
        "f7" = "layout_action rotate";
        "shift+up" = "move_window up";
        "shift+left" = "move_window left";
        "shift+right" = "move_window right";
        "shift+down" = "move_window down";
        # "ctrl+shift+up" = "layout_action move_to_screen_edge up";
        # "ctrl+shift+left" = "layout_action move_to_screen_edge left";
        # "ctrl+shift+right" = "layout_action move_to_screen_edge right";
        # "ctrl+shift+down" = "layout_action move_to_screen_edge down";
        "ctrl+up" = "neighboring_window up";
        "ctrl+left" = "neighboring_window left";
        "ctrl+right" = "neighboring_window right";
        "ctrl+down" = "neighboring_window down";
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
        # wayland_titlebar_color = "#21232D";
        wayland_titlebar_color = "#202030";
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
      };
      # extraConfig = ''
      # '';
    };
  };

  # home.packages = with pkgs; [
  #   kitty
  # ];

}
