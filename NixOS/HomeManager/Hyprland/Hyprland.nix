{ config, lib, osConfig, pkgs, ... }:

let
  displaySettings = osConfig.modDesktop.display;
in
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    wayland.windowManager.hyprland = {
      enable = true;
      plugins = with pkgs.hyprlandPlugins; [
        hyprscrolling
      ];
      settings = {
        monitor = displaySettings;

        exec-once = [
          "vesktop"
          "firefox"
          "evolution"
          "steam"
        ];

        input = {
	        kb_layout = "gb";
	        numlock_by_default = true;
	        accel_profile = "flat";
	      };
        
        gestures = {
          workspace_swipe = true;
          workspace_swipe_forever = true;
        };
        
        general = {
          gaps_out = 5;
          gaps_in = 3;
        };

        decoration = {
          rounding = 5;
          rounding_power = 3;
        };
      };
    };
  };
}