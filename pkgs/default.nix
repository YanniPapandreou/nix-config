# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  # example = pkgs.callPackage ./example { };
  pandantic = pkgs.python3Packages.callPackage ./pandantic { };
  ward = pkgs.python3Packages.callPackage ./ward { };
  bootdev = pkgs.callPackage ./bootdev { };
  polars = pkgs.python3Packages.callPackage ./polars { };
  simple-completion-language-server = pkgs.callPackage ./simple-completion-language-server { };
  rstyler = pkgs.callPackage ./rstyler { };
}
