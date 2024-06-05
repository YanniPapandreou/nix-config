# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  # example = pkgs.callPackage ./example { };
  pandantic = pkgs.python3Packages.callPackage ./pandantic { };
  sec-edgar-downloader = pkgs.python3Packages.callPackage ./sec-edgar-downloader { };
  edgartools = pkgs.python3Packages.callPackage ./edgartools { };
  ward = pkgs.python3Packages.callPackage ./ward { };
  bootdev = pkgs.callPackage ./bootdev { };
}
