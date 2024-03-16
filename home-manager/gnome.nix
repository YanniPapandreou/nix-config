{ pkgs, ... }:
{

  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  dconf.settings = {
    # "org/gnome/desktop/wm/keybindings" = {
    #   switch-to-workspace-1 = "[<Super>1]";
    # };
    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = "disabled";
      switch-to-application-2 = "disabled";
      switch-to-application-3 = "disabled";
      switch-to-application-4 = "disabled";
    };
    "org/gnome/desktop/wm/keybindings" = {
      # activate-window-menu = ["disabled"];
      # toggle-message-tray = ["disabled"];
      close = ["<Super>q"];
      # maximize = ["disabled"];
      # minimize = ["<Super>comma"];
      move-to-monitor-down = ["disabled"];
      move-to-monitor-left = ["disabled"];
      move-to-monitor-right = ["disabled"];
      move-to-monitor-up = ["disabled"];
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      move-to-workspace-5 = ["<Shift><Super>5"];
      move-to-workspace-6 = ["<Shift><Super>6"];
      move-to-workspace-down = ["disabled"];
      move-to-workspace-up = ["disabled"];
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      # switch-to-workspace-left = ["<Super>bracketleft"];
      # switch-to-workspace-right = ["<Super>bracketright"];
      # switch-input-source = ["disabled"];
      # switch-input-source-backward = ["disabled"];
      # toggle-maximized = ["<Super>Up"];
      # unmaximize = ["disabled"];
    };
  };
}
