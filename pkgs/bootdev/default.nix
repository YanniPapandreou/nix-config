{ lib
, buildGoModule
, fetchFromGitHub
}:

  buildGoModule rec {
    pname = "bootdev";
    version = "1.5.5";

    src = fetchFromGitHub {
      owner = "bootdotdev";
      repo = "bootdev";
      rev = "11d2727a102f268ad6783c5bdc41d9fa7c74dc7e";
      hash = "sha256-ogBTbQ9xTX1UxmVT0I6alTb15AUDES82DHRDUMeiQfc=";
    };

    vendorHash = "sha256-v5P+Pt9weZ6+kkxfgpk+8GIOJRqp+Jx5uF3AJdRnp0s=";

    meta = with lib; {
      description = "Official command line tool for Boot.dev";
      homepage = "https://github.com/bootdotdev/bootdev";
      license = licenses.mit;
      maintainers = with maintainers; [ yannip ];
      mainProgram = "bootdev";
    };

  }

