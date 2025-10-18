{ config, lib, osConfig, pkgs, ... }:

let
  screenshot = "${pkgs.grimblast}/bin/grimblast";
  colourPicker = "${pkgs.hyprpicker}/bin/hyprpicker";
  ocr = "${pkgs.tesseract}/bin/tesseract";
  backlightControl = "${pkgs.brightnessctl}/bin/brightnessctl";
in
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    wayland.windowManager.hyprland = {
      settings = {
        "$mod" = "SUPER";

        binds = {
          drag_threshold = 10;
        };
        
        bind = [
	        "$mod, q, killactive, "
          "$mod, f, fullscreen, "
          "$mod, l, exec, loginctl lock-session"
          "$mod, b, exec, firefox"
	        "$mod, e, exec, thunar"
          "$mod, r, exec, vicinae toggle"
	        "$mod, return, exec, kitty"
          "$mod SHIFT, c, exec, ${colourPicker} -a"
          "$mod SHIFT, s, exec, ${screenshot} copy area"
          "$mod SHIFT, t, exec, ${screenshot} save area stdout | ${ocr} stdin stdout | wl-copy"
          "$mod SHIFT, b, exec, bluetoothctl power $(bluetoothctl show | grep -q \"Powered: yes\" && echo off || echo on)"
          "$mod SHIFT, h, movefocus, l"
          "$mod SHIFT, j, movefocus, d"
          "$mod SHIFT, k, movefocus, u"
          "$mod SHIFT, l, movefocus, r"
          "$mod CONTROL, h, movewindow, l"
          "$mod CONTROL, j, movewindow, d"
          "$mod CONTROL, k, movewindow, u"
          "$mod CONTROL, l, movewindow, r"
        ]
        ++ (
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
              ]
            )
          9)
        );
        
        # Bind Mouse Move
        bindm = [
	        "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
	      ];
        
        # Bind On-Click
        bindc = [
	        "$mod, mouse:274, togglefloating"
	      ];
        
        # Bind Even When Locked
	      bindl = [
	        ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
	        ", XF86AudioPlay, exec, playerctl play-pause"
	        ", XF86AudioStop, exec, playerctl stop"
	      ];
        
        # Bind Repeat While Held, Even When Locked
	      bindel = [
	        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
          ", XF86MonBrightnessUp, exec, ${backlightControl} set +5%"
          ", XF86MonBrightnessDown, exec, ${backlightControl} set 5%-"
          "SHIFT, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_SOURCE@ 5%+"
	        "SHIFT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SOURCE@ 5%-"
          "SHIFT, XF86AudioMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
	      ];
        
        # Bind Press & Hold, Even When Locked
	      bindol = [
	        ", XF86AudioNext, exec, playerctl position 5+"
	        ", XF86AudioPrev, exec, playerctl position 5-"
	      ];
      };
    };
  };
}