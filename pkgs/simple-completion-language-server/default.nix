{ pkgs, lib, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "simple-completion-language-server";
  version = "0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "estin";
    repo = "simple-completion-language-server";
    rev = "dcf830015bf602775479b38368c6454bfc037cd9";
    sha256 = "sha256-syKLDeepdNUW9mgDRzp9OMqA4mDFmjI00Xws0Z0co2Q=";
  };

  buildInputs = with pkgs; [
    rustc
    cargo
  ];

  cargoSha256 = "";

  buildPhase = ''
    cargo build --release
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp target/release/simple-completion-language-server $out/bin/
  '';
}
