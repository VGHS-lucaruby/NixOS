{ config, lib, osConfig, ... }:

{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    wayland.windowManager.hyprland = {
      settings = {
        windowrule = [ # Set Tag
          "tag +browser, initialClass:firefox"
          "tag +media, class:mpv"
          "tag +media, class:vlc"
          "tag +file, class:thunar"
          "tag +game, class:(steam_app_)(.*)"
          "tag +game, xdgTag: proton-game"
          "tag +game, class:(Minecraft)(.*)"
          "tag +launcher, class:steam"
          "tag +launcher, class:net.lutris.Lutris"
          "tag +launcher, class:org.prismlauncher.PrismLauncher"
          "tag +messenging, class:vesktop"
          "tag +messenging, class:wasistlos"
          "tag +mail, class:org.gnome.Evolution"
          "tag +term, class:kitty"
          "tag +code, class:code"
          "tag -browser, tag:media"
        ] ++ [ # Action Tag
          "workspace 1, tag:browser"
          "workspace 2, tag:media"
          "workspace 3, tag:game"
          "workspace 4, tag:launcher"
          "workspace 5, tag:messenging"
          "workspace 6, tag:mail"
          "workspace 7, tag:file"
          "workspace 8, tag:term"
          "workspace 9, tag:code"
        ];
      };
    };
  };
}