{ pkgs, ... }:
let
  # gtk-theme = "Dracula";
  # cursor-theme = "BreezeX-Light";
  nerdfonts = (pkgs.nerdfonts.override { fonts = [
    "Ubuntu"
    "UbuntuMono"
    "CascadiaCode"
    "FantasqueSansMono"
    "FiraCode"
    "Mononoki"
    "Noto"
  ]; });
in
{

  fonts.fontconfig.enable = true;

  home = {
    packages = with pkgs; [
      kora-icon-theme
      carlito
      corefonts
      font-awesome
      gnome-icon-theme
      hicolor-icon-theme
      jetbrains-mono
      source-code-pro
      nerdfonts
    ];
    # sessionVariables = {
    #   XCURSOR_THEME = cursor-theme;
    #   XCURSOR_SIZE = "24";
    # };
    # pointerCursor = {
    #   package = cursor-package;
    #   name = cursor-theme;
    #   size = 24;
    #   gtk.enable = true;
    # };
    file = {
      ".local/share/fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
      ".fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
      # ".config/gtk-4.0/gtk.css" = {
      #   text = ''
      #     window.messagedialog .response-area > button,
      #     window.dialog.message .dialog-action-area > button,
      #     .background.csd{
      #       border-radius: 0;
      #     }
      #   '';
      # };
    };
  };

  # gtk = {
  #   enable = true;
  #   font.name = "Ubuntu Nerd Font";
  #   theme.name = gtk-theme;
  #   cursorTheme = {
  #     name = cursor-theme;
  #     size = 24;
  #   };
  #   iconTheme.name = "kora";
  #
  #   gtk3.extraConfig = {
  #     settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
  #
  #   gtk4.extraConfig = {
  #     settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
  # };

  # home.sessionVariables.GTK_THEME = gtk-theme;
  # qt = {
  #   enable = true;
  #   platformTheme = "kde";
  # };
}
