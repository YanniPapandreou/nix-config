{pkgs,...}:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      cfg = {
        enableTridactylNative = true;
      };
    };
  };
  xdg.configFile.tridactyl = {
    source = ./tridactyl_config;
    recursive = true;
  };
}
