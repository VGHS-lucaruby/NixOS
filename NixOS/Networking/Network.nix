{ config, lib, ... }:

{
  networking.networkmanager.enable = true;
  
  networking.useDHCP = lib.mkDefault true;

  networking.nameservers = [ "9.9.9.9" "1.1.1.1" ];
}