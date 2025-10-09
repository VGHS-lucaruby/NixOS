{ config, lib, pkgs, ... }:

{
  imports = [
    ./Gnome
    ./Hyprland
  ];

  services = {
    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    xserver.xkb.layout = "gb";
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}