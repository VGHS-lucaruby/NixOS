{ config, ... }:

{
  users.users.lucaruby = {
    isNormalUser = true;
    description = "Luca Crisafi";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}