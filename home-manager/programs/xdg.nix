{config, ...}: let
  browser = ["firefox.desktop"];

  # XDG MIME types
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = ["google-chrome.desktop"];
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;

    # "audio/*" = ["mpv.desktop"];
    # "video/*" = ["mpv.dekstop"];
    # "application/json" = browser;
    "application/pdf" = ["sioyek.desktop"];
    # "x-scheme-handler/discord" = ["discordcanary.desktop"];
    # "x-scheme-handler/spotify" = ["spotify.desktop"];
    # "x-scheme-handler/tg" = ["telegramdesktop.desktop"];
    "image/jpeg" = ["org.gnome.eog.desktop"];
    "image/png" = ["org.gnome.eog.desktop"];
  };
in {
  xdg = {
    enable = true;
    cacheHome = "/home/yanni/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      # extraConfig = {
      #   XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      # };
    };
  };
}
