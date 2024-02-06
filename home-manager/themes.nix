{ pkgs, ... }:
let
  theme-name = "Dracula";
in
{
  gtk = {
    enable = true;

    theme = {
      name = theme-name;
    };

    iconTheme = {
      name = "kora";
    };

    cursorTheme = {
      name = "BreezeX-Light";
      size = 24;
    };

    gtk3.extraConfig = {
      settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = theme-name;
}
