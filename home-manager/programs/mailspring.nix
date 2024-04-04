{pkgs,...}:
{
  home.packages = with pkgs; [ mailspring ];

  xdg.desktopEntries = {
    Mailspring = {
      name = "Mailspring";
      comment = "The best email app for people and teams at work";
      genericName = "Mail Client";
      exec = ''
      mailspring --password-store="gnome-libsecret" %U
      '';
      icon = "mailspring";
      type = "Application";
      startupNotify = true;
      categories = ["GNOME" "GTK" "Network" "Email"];
      mimeType = ["x-scheme-handler/mailto" "x-scheme-handler/mailspring"];
    };
  };
}
