{ config, lib, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      enableStrongSwan = true;
    };
    useDHCP = lib.mkDefault true;

    firewall.enable = false;
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
  };
}