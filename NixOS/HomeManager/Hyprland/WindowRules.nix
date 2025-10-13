{ config, lib, osConfig, ... }:

{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    wayland.windowManager.hyprland = {
      settings = {
        windowrule = [ # Set Tag
          "tag +browser, class:firefox"
          "tag +file, class:thunar"
          "tag +game, class:(steam_app_)(.*)"
          "tag +game, xdgTag: proton-game"
          "tag +launcher, class:steam"
          "tag +launcher, class:net.lutris.Lutris"
          "tag +messenging, class:vesktop"
          "tag +mail, class:org.gnome.Evolution"
          "tag +media, class:mpv"
          "tag +media, class:vlc"
          "tag +term, class:kitty"
          "tag +code, class:Code"
        ] ++ [ # Action Tag
          "workspace 1, tag:browser"
          "workspace 2, tag:file"
          "workspace 3, tag:game"
          "workspace 4, tag:launcher"
          "workspace 5, tag:messenging"
          "workspace 6, tag:mail"
          "workspace 2, tag:media"
          "workspace 8, tag:term"
          "workspace 9, tag:code"
        ];
      };
    };
  };
}