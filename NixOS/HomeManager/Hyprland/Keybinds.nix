{ config, lib, osConfig, pkgs, ... }:

let
  screenshot = "${pkgs.grimblast}/bin/grimblast";
  playerControl = "${pkgs.playerctl}/bin/playerctl";
  colourPicker = "${pkgs.hyprpicker}/bin/hyprpicker";
  ocr = "${pkgs.tesseract}/bin/tesseract";
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
          "$mod, b, exec, firefox"
	        "$mod, e, exec, thunar"
          "$mod, r, exec, pkill rofi || rofi -show drun"
	        "$mod, return, exec, kitty"
          "$mod SHIFT, c, exec, ${colourPicker} -a"
          "$mod SHIFT, s, exec, ${screenshot} copy area"
          "$mod SHIFT, t, exec, ${screenshot} save area stdout | ${ocr} stdin stdout | wl-copy"
        ]
        ++ (
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
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
	        ", XF86AudioNext, exec, ${playerControl} next"
          ", XF86AudioPrev, exec, ${playerControl} previous"
	        ", XF86AudioPlay, exec, ${playerControl} play-pause"
	        ", XF86AudioStop, exec, ${playerControl} stop"
	      ];
        
        # Bind Repeat While Held, Even When Locked
	      bindel = [
	        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	      ];
        
        # Bind Press & Hold, Even When Locked
	      bindol = [
	        ", XF86AudioNext, exec, ${playerControl} position 5+"
	        ", XF86AudioPrev, exec, ${playerControl} position 5-"
	      ];
      };
    };
  };
}