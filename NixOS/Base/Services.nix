{ config, pkgs, pkgs-unstable, ... }:

{
  services = {
    printing.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
  };
}