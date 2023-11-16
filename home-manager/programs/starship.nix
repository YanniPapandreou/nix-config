{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = false;
  };
  home.file.".config/starship.toml".source = ./starship.toml;
}
