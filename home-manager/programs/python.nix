{ pkgs, ... }:
let
  my-python-packages = ps: with ps; [
    debugpy
    ipython
    jsonpickle
    ptpython
    pycairo
    pygobject3
    pympler
    python-lsp-server
    pyyaml
    requests
    rich
    setuptools
    # ward
    wheel
    pkgs.sec-edgar-downloader
  ];
in
{

  home.packages = with pkgs; [
    (python311.withPackages my-python-packages)
    ruff
    ruff-lsp
  ];

}
