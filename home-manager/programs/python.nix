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
    pylatexenc
    pyyaml
    requests
    rich
    setuptools
    # ward
    wheel
    # z3-solver
    # pkgs.sec-edgar-downloader
    # pkgs.edgartools
  ];
in
{

  home.packages = with pkgs; [
    (python312.withPackages my-python-packages)
    ruff
    ruff-lsp
  ];

}
