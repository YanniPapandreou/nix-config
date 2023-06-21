{ pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "Dracula";
    };

    iconTheme = {
      name = "kora";
    };

    cursorTheme = {
      name = "BreezeX-Light";
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "Dracula";
}
