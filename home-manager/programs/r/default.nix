{ pkgs, ... }:
let
  rWrapper = pkgs.rWrapper;
  rstudioWrapper = pkgs.rstudioWrapper;
  radianWrapper = pkgs.radianWrapper;
  Rpackages = with pkgs.rPackages; [
    ISLR
    Lahman
    MASS
    R6
    RSQLite
    RcppTOML
    argparse
    argparser
    babynames
    bench
    cli
    devtools
    extRemes
    faraway
    ggthemes
    glue
    httpgd
    janitor
    languageserver
    lobstr
    microbenchmark
    modelr
    nycflights13
    palmerpenguins
    prettycode
    pryr
    rbenchmark
    reactable
    reprex
    reshape2
    sloop
    testthat
    tictoc
    tidyverse
    usethis
    zeallot
DBI
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
    pkgs.rstyler
    pkgs.gnumake
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
  };

}
