{ config, lib, ... }:

{
  config = lib.mkIf (config.modDesktop.name == "Gnome") {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.xkb = {
      layout = "gb";
    };

    # Hint Electon apps to use wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}