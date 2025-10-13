{ config, lib, osConfig, pkgs, ... }:

let
  CSS = builtins.readFile ./Style.css;
  btController = "${pkgs.overskride}/bin/overskride";
in
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    programs.waybar = {
      enable = true;
      style = CSS;
      systemd = {
        enable = true;
        enableInspect = false;
      };
      settings = {
        mainBar = {
          height = 18;
          spacing = 4;
          layer = "top";
          position = "top";
          modules-left = [ 
            "hyprland/workspaces"
            "mpris"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "idle_inhibitor"
            "cpu"
            "memory"
            "disk"
            "battery"
            "wireplumber"
            "bluetooth"
            "tray" 
          ];

          mpris = { 
         	  format = "{status_icon} {dynamic}";
            interval = 1;
            dynamic-len = 40;
            dynamic-order = [
              "title" 
              "artist"
            ];
        	  status-icons = {
        	  	playing = "";
        	  	paused = "";
        	  	stopped = "";
        	  };
          };

          clock = {
	        	tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
	        	format = "{:%T %F}";
            on-click = "swaync-client -t";
	        	interval = 1;
	        };

          tray = {
            icon-size = 14;
            spacing = 10;
          };

          cpu = {
            interval = "10";
            format = " {usage}%";
          };

          memory = {
            format = " {}%";
          };
          
          wireplumber = {
            scroll-step = 5;
            format = "{icon} {volume}%";
            format-icons = [ "" "" "" ];
            format-muted = " {volume}%";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };

          disk = {
            interval = 60;
            format = "󰋊 {used} / {total}";
            path = "/";
          };

          idle_inhibitor = {
            format = "{icon}";
            format-icons = {
              activated = "󰅶";
              deactivated = "󰾪";
            };
          };

          bluetooth = {
            on-click = btController;
	          format = " {status}";
	          format-connected = "󰂰 {device_alias}";
	          format-connected-battery = "󰂰 {device_alias} 󰁾{device_battery_percentage}%";
            format-disabled = "󰂲";
            format-off = "󰂲";
            format-no-controller = "";
	          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
	          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
	          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
	          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          };
        };
      };
    };
  };
}