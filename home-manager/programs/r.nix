{ pkgs, ... }:
let
  rWrapper = pkgs.rWrapper;
  rstudioWrapper = pkgs.rstudioWrapper;
  radianWrapper = pkgs.radianWrapper;
  Rpackages = with pkgs.rPackages; [
    ISLR
    MASS
    cli
    devtools
    faraway
    ggthemes
    glue
    languageserver
    lobstr
    modelr
    pryr
    reshape2
    testthat
    tidyverse
    usethis
  ];
  R-with-my-packages = rWrapper.override{ packages = Rpackages; };
  radian-with-my-packages = radianWrapper.override{ packages = Rpackages; };
  RStudio-with-my-packages = rstudioWrapper.override{ packages = Rpackages; };
in
{
  home.packages = [
    R-with-my-packages
    radian-with-my-packages
    RStudio-with-my-packages
  ];

  xdg.desktopEntries = {
    RStudio = {
      name = "RStudio";
      comment = "R IDE";
      genericName = "IDE";
      exec = ''
      rstudio
      '';
      # icon = "";
      type = "Application";
    };
  };

  programs.fish.shellAliases = {
    r = "radian";
    nvimr = "R_AUTO_START=true nvim";
  };

}
