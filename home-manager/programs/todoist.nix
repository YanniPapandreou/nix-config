{ pkgs, ... }:
{
  home.packages = with pkgs; [
    todoist
  ];

  xdg.desktopEntries.todoist = {
    name = "Todoist";
    genericName = "Task Planner";
    exec = "firefox -new-window https://todoist.com/app/today";
    terminal = false;
    categories = [ "Application" ];
    icon = "/home/yanni/nix-config/home-manager/desktop-icons/Todoist/Noir.png";
  };

}
