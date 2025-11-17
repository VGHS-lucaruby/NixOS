{ config, lib, osConfig, pkgs, ... }:

let
  CSS = builtins.readFile ./Style.rasi;
in
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    programs.rofi = {
      enable = true;
      # theme = CSS;
      font = "${config.gtk.font.name} ${toString config.gtk.font.size}";
      plugins = with pkgs; [
        rofi-calc
      ];
    };
  };
}