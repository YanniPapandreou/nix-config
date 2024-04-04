{
  programs.git = {
      enable = true;
      userEmail = "ypapandreou@proton.me";
      userName = "Yanni Papandreou";
      extraConfig = {
        color.ui = true;
        init = {
            defaultBranch = "main";
        };
        core = {
          editor = "nvim";
        };
      };
  };
}
