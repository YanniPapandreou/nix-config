{
  programs.git = {
      enable = true;
      userEmail = "nepo1y@gmail.com";
      userName = "Yanni Papandreou";
      extraConfig = {
        init = {
            defaultBranch = "main";
        };
        core = {
          editor = "nvim";
        };
      };
  };
}
