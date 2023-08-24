# example homemanager module
{ config, pkgs, ... }:

let
  # xdg-open won't work currently as the XDG_DATA_DIRS that are prepended mess
  # with its ability to open urls.
  xdgOpenWrapper = pkgs.writeScriptBin "xdg-open" ''
    #!${pkgs.stdenv.shell}

    url="$1"

    if [[ $url =~ https://* ]]; then
      ${pkgs.glib}/bin/gdbus call --session \
        --dest org.freedesktop.portal.Desktop \
        --object-path /org/freedesktop/portal/desktop \
        --method org.freedesktop.portal.OpenURI.OpenURI \
        --timeout 5 \
        "" "$url" {}
    else
      echo "Ignoring xdg-open call with $1"
    fi
  '';
in {
  nixpkgs.overlays = [
    (final: prev: {
      todoist-electron = prev.todoist-electron.overrideAttrs (old: rec {
        postFixup = ''
          makeWrapper ${final.electron_15}/bin/electron $out/bin/${old.pname} \
            --add-flags $out/share/${old.pname}/resources/app.asar \
            --prefix PATH : "${xdgOpenWrapper}/bin" \
            --prefix LD_LIBRARY_PATH : "${
              final.lib.makeLibraryPath [ final.stdenv.cc.cc final.libsecret ]
            }"
        '';
      });
    })
  ];

  home.packages = builtins.attrValues { inherit (pkgs) todoist-electron; };
}
