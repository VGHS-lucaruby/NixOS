{ config, lib, osConfig, ... }:

{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    wayland.windowManager.hyprland = {
      settings = {
        windowrule = [ # Set Tag
          "tag +browser, class:firefox"
          "tag +file, class:thunar"
          "tag +game, class:(steam_app_)(.*)"
          "tag +launcher, class:steam"
          "tag +messenging, class:org.gnome.Evolution"
          "tag +messenging, class:vesktop"
          "tag +term, class:kitty"
          "tag +code, class:code"
        ] ++ [ # Action Tag
          "workspace 1, tag:browser"
          "workspace 2, tag:file"
          "workspace 3, tag:game"
          "workspace 4, tag:launcher"
          "workspace 5, tag:messenging"
          "workspace 8, tag:term"
          "workspace 9, tag:code"
        ];
      };
    };
  };
}