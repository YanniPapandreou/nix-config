{ pkgs, ... }:
let
  my-python-packages = ps: with ps; [
    ipython
    jsonpickle
    pycairo
    pygobject3
    python-lsp-server
    pyyaml
    requests
    wheel
  ];
in
{

  home.packages = with pkgs; [
    (python311.withPackages my-python-packages)
  ];

}
