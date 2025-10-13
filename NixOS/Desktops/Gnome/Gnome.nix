{ config, lib, ... }:

{
  config = lib.mkIf (config.modDesktop.name == "Gnome") {
    services = {
      xserver.enable = true;
      xserver.desktopManager.gdm.enable = true;
      xserver.desktopManager.gnome.enable = true;
      xserver.xkb.layout = "gb";
      gnome.gnome-keyring.enable = true;
    };
  };
}