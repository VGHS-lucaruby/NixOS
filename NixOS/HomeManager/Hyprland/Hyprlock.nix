{ config, lib, osConfig, pkgs, ... }:

let
  wallpaper = config.modDesktopUser.background;
in
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    programs.hyprlock = {
      enable = true;
      settings = {
        "$font" = config.gtk.font.name;

        auth = {
          fingerprint = {
              enabled = osConfig.services.fprintd.enable;
              ready_message = "Scan fingerprint to unlock";
              present_message = "Scanning...";
          };
        };

        animations = {
          enabled = "true";
          bezier = "linear, 1, 1, 0, 0";
          animation = [
            "fadeIn, 1, 5, linear"
            "fadeOut, 1, 5, linear"
            "inputFieldDots, 1, 2, linear"
          ];
        };

        background = {
          path = "${wallpaper}";
          blur_passes = 2;
        };

        input-field = {
          size = "20%, 5%";
          outline_thickness = 3;
          inner_color = "rgba(0, 0, 0, 0.0)";

          outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
          fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

          font_color = "rgb(143, 143, 143)";
          fade_on_empty = "false";
          rounding = 15;

          font_family = "$font";
          placeholder_text = "Enter password...";

          dots_spacing = "0.3";

          position = "0, -20";
          halign = "center";
          valign = "center";
        };

        label = [
          {
            text = "$TIME";
            font_size = 120;
            font_family = "$font";
            position = "0, -50";
            valign = "top";
          }
          {
            text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
            font_size = 25;
            font_family = "$font";
            position = "0, -230";
            valign = "top";
          }
        ];
      };
    };
  };
}