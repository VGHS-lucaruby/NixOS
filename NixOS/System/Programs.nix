{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  programs.adb.enable = true;

  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.xone.enable = true;
}