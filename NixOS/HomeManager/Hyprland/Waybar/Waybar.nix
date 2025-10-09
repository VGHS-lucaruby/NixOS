{ config, lib, osConfig, pkgs, ... }:

let
  CSS = builtins.readFile ./Style.css;
in
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    programs.waybar = {
      enable = true;
      style = CSS;
      systemd = {
        enable = true;
        enableInspect = true;
      };
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "hyprland/window" ];
          modules-right = [ "tray" "clock" ];
          "hyprland/workspaces" = {
              on-scroll-up = "hyprctl dispatch workspace e+1";
              on-scroll-down = "hyprctl dispatch workspace e-1";
          };
          "clock" = {
	        	tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
	        	format = "{:%F %T}";
	        	format-alt = "{:%F %T}";
	        	interval = 1;
	        };
        };
      };
    };
  };
}