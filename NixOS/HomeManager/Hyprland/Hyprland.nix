{ config, lib, osConfig, pkgs, ... }:

let
  displaySettings = osConfig.modDesktop.display;
in
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    wayland.windowManager.hyprland = {
      enable = true;
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
          touchpad = {
            natural_scroll = true;
          };
	      };
        
        gestures = {
          workspace_swipe = true;
          workspace_swipe_forever = true;
          workspace_swipe_direction_lock_threshold = 0;
        };
        
        general = {
          gaps_out = 5;
          gaps_in = 3;
          "col.active_border" = "0xFF8FBCBB";
          "col.inactive_border" = "0xFF434C5E";
        };

        decoration = {
          rounding = 5;
          rounding_power = 3;
          inactive_opacity = 0.98;
          blur = { 
            enabled = false;
          };
          shadow = {
            enabled = false;
          };
        };

        misc = {
          vfr = true;
        };

        xwayland = {
          force_zero_scaling = true;
        };
      };
    };
  };
}