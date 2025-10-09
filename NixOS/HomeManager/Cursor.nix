{ config, pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    name = "Nordzy-cursors-white";
    package = pkgs.nordzy-cursor-theme;
    size = 24;
    hyprcursor = {
      enable = config.wayland.windowManager.hyprland.enable;
    };
  };
}