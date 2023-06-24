{
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    flags = [
      "--disable-up-arrow"
    ];
    settings = {
      dialect = "uk";
      auto_sync = false;
      sync_address = "";
      style = "compact";
      show_preview = true;
    };
  };
}
