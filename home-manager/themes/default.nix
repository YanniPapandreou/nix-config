{ pkgs, ... }:
{

  home.file.".themes/my-dracula" = {
    source = pkgs.fetchzip {
      url = "https://github.com/dracula/gtk/releases/download/v4.0.0/Dracula.tar.xz";
      sha256 = "sha256-qs/vAIsSR0ApMpLYS5pB+ugYt1+UX5xOlR2FxC3ZK/c=";
      stripRoot = false;
    };
    recursive = true;
  };

}
