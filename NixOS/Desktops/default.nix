{ config, lib, pkgs, ... }:

{
  imports = [
    ./Gnome
    ./Hyprland
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
