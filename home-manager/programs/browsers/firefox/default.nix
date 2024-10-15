{pkgs,...}:
{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = with pkgs; [
      tridactyl-native
      kdePackages.plasma-browser-integration
    ];
  };

  # xdg.configFile.tridactyl = {
  #   source = ./tridactyl_config;
  #   recursive = true;
  # };

}
