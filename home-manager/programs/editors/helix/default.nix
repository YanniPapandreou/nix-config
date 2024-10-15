{ inputs, pkgs, ...}:
{
  home.packages = with pkgs; [
    helix
    # external.snippets-ls
    inputs.simple-completion-language-server.defaultPackage.${pkgs.system}
  ];

  # xdg.configFile.helix = {
  #   source = ./config;
  #   recursive = true;
  # };
}
