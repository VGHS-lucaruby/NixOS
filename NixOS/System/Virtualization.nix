{ config, ... }:

{
  virtualisation.waydroid.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}