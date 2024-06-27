{ config, lib, ... }:

{
  networking.networkmanager = {
    enable = true;
    enableStrongSwan = true;
  };
  
  networking.useDHCP = lib.mkDefault true;
}