{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    #enableBashIntegration = true;
  };
  home.file.".config/starship.toml".source = ./starship.toml;
}
