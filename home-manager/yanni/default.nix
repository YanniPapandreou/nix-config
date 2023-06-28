{

  imports = [
    ../programs
    ../fonts.nix
    ../themes.nix
  ];

  home = {
    username = "yanni";
    homeDirectory = "/home/yanni";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  programs.password-store = {
    enable = true;
  };

}
