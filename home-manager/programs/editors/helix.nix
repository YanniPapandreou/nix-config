{ pkgs, ... }: {

  home.packages = with pkgs; [
    helix
    # external.snippets-ls
  ];

}
