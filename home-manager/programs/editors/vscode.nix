{pkgs, ...}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      # eamodio.gitlens
      ms-python.python
      # ms-toolsai.jupyter
      # vscodevim.vim
    ];
  };
}
