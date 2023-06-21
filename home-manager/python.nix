{ pkgs, ... }:
{

  home.packages = with pkgs; [
    (python311.withPackages(ps: with ps; [
      ipython
      jsonpickle
      pycairo
      pygobject3
      requests
      wheel
    ]))
  ];

}
