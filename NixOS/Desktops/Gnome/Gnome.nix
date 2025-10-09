{ config, lib, ... }:

{
  config = lib.mkIf (config.modDesktop.name == "Gnome") {
    services.xserver.desktopManager.gnome.enable = true;
  };
}