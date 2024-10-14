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

  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];

  hardware.xone.enable = true;
}