{ pkgs, ... }:
let
  my-python-packages = ps: with ps; [
    ipython
    jsonpickle
    pycairo
    pygobject3
    pympler
    python-lsp-server
    pyyaml
    requests
    wheel
    # nwg-panel deps
    dasbus
    i3ipc
    netifaces
    psutil
    setuptools
  ];
in
{

  home.packages = with pkgs; [
    (python311.withPackages my-python-packages)
  ];

}
