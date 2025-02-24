{ config, ... }:

{
  users.users = {
    lucaruby = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    };
    kuma = {
      isNormalUser = true;
    };
  };
}