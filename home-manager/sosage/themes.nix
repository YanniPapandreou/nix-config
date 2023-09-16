{ pkgs, ... }:
{
  
  home.packages = with pkgs; [
    whitesur-gtk-theme
    whitesur-icon-theme
  ];

  gtk = {
    enable = true;

    theme = {
      name = "WhiteSur-Light";
    };

    iconTheme = {
      name = "kora";
    };

    cursorTheme = {
      name = "BreezeX-Light";
    };

    # gtk3.extraConfig = {
    #   Settings = ''
    #     gtk-application-prefer-dark-theme=1
    #   '';
    # };

    # gtk4.extraConfig = {
    #   Settings = ''
    #     gtk-application-prefer-dark-theme=1
    #   '';
    # };
  };

  home.sessionVariables.GTK_THEME = "WhiteSur-Light";
}
