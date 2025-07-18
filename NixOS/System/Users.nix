{ config, ... }:

{
  users.users = {
    lucaruby = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "dialout" ];
    };
    kuma = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}