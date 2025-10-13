{ config, lib, osConfig, pkgs, ... }:

let
  backlightControl = pkgs.brightnessctl;
in
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 90;
            on-timeout = "${backlightControl} -s set 10";
            on-resume = "${backlightControl} -r";
          }
  
          { 
            timeout = 90;
            on-timeout = "${backlightControl} -sd rgb:kbd_backlight set 0";
            on-resume = "${backlightControl} -rd rgb:kbd_backlight";
          }
  
          {
            timeout = 150;
            on-timeout = "loginctl lock-session";
          }
  
          {
            timeout = 180;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on && ${backlightControl} -r";
          }
  
          {
            timeout = 240;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}