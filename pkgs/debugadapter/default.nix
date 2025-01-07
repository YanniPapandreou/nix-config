{ pkgs }:
  pkgs.rPackages.buildRPackage {
    name = "debugadapter";
    src = pkgs.fetchFromGitHub {
      owner = "dgkf";
      repo = "debugadapter";
      rev = "89f7aaa34ceed6f92bfce45ed7f1baa051ccf3a8";
      sha256 = "sha256-vY47zPWqkzY9qdZkTzPP3LPOz/bLZD7EDVrwmX3FUKk=";
    };
    propagatedBuildInputs = with pkgs.rPackages; [ callr cli R6 rlang ];
  }
