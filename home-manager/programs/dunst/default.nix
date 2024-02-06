{
  # notification manager
  services.dunst = {
    enable = true;
    configFile = ./dunstrc;
    # settings = {
    #   global = {
    #     width = 300;
    #     height = 200;
    #     offset = "30x50";
    #     origin = "top-right";
    #     transparency = 10;
    #   };
    # };
  };
}
