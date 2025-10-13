{ config, lib, hostname, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      enableStrongSwan = true;
    };
    useDHCP = lib.mkDefault true;
    hostName = hostname;
    firewall.enable = false;
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
  };
}