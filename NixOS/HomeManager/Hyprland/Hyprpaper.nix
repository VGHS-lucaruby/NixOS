{ config, lib, osConfig, pkgs, ... }:

let
  wallpaper = config.modDesktopUser.background;
in
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "${wallpaper}" ];
        wallpaper = [ ", ${wallpaper}"];
      };
    };
  };
}