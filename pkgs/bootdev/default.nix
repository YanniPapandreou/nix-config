{ lib
, buildGoModule
, fetchFromGitHub
}:

  buildGoModule rec {
    pname = "bootdev";
    version = "1.5.8";

    src = fetchFromGitHub {
      owner = "bootdotdev";
      repo = "bootdev";
      rev = "0c301fab3ffb6bc0c1d57919e53a4c9c63d60f22";
      hash = "sha256-FHh/TLbnyoqiM5L459nqDo0/4/LXnYT6gIy7TFKE/ZY=";
    };

    vendorHash = "sha256-jhRoPXgfntDauInD+F7koCaJlX4XDj+jQSe/uEEYIMM=";

    meta = with lib; {
      description = "Official command line tool for Boot.dev";
      homepage = "https://github.com/bootdotdev/bootdev";
      license = licenses.mit;
      maintainers = with maintainers; [ yannip ];
      mainProgram = "bootdev";
    };

  }

