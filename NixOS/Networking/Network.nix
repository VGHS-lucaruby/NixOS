{ config, lib, ... }:

{
  networking.networkmanager = {
    enable = true;
    enableStrongSwan = true;
  };
  services.resolved = {
    enable = true;
    dnssec = "true";
  };
  networking.useDHCP = lib.mkDefault true;
}