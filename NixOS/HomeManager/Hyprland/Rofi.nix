{ config, lib, osConfig, pkgs, ... }:

{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    programs.rofi = {
      enable = true;
      font = config.gtk.font.name;
    };
  };
}