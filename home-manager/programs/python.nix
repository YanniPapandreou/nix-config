{ pkgs, ... }:
let
  my-python-packages = ps: with ps; [
    ipython
    jsonpickle
    ptpython
    pycairo
    pygobject3
    pympler
    python-lsp-server
    pyyaml
    rich
    requests
    setuptools
    ward
    wheel
    # nwg-panel deps
    # dasbus
    # i3ipc
    # netifaces
    # psutil
  ];
in
{

  home.packages = with pkgs; [
    (python311.withPackages my-python-packages)
  ];

}
