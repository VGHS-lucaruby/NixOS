{ config, pkgs, pkgs-unstable, ... }:

{
  services = {
    printing.enable = true;
    gvfs.enable = true;
    playerctld.enable = true;
  };
}