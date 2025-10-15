{ config, lib, osConfig, ... }:

# todo: theming
{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    services.swaync = {
      enable = true;
      settings = {
        positionX = "center";
        positionY = "top";
        layer = "overlay";
        control-center-layer = "top";
        layer-shell = true;
        ignore-gtk-theme = false;
        cssPriority = "user";
        control-center-width = 700;
        control-center-margin-top = 5;
        control-center-margin-bottom = 500;
        notification-2fa-action = true;
        notification-inline-replies = false;
        notification-icon-size = 64;
        notification-body-image-height = 100;
        notification-body-image-width = 200;
      };
    };
  };
}