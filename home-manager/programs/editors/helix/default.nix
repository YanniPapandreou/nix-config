{pkgs, ...}:
{
  home.packages = with pkgs; [
    helix
    # external.snippets-ls
  ];

  xdg.configFile.helix = {
    source = ./config;
    recursive = true;
  };
}
