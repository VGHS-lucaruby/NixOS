{ config, pkgs, pkgs-unstable, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16" # nheko
  ];

  environment.systemPackages = ( with pkgs; [
    whatsapp-for-linux
    nheko
    telegram-desktop
  ]) ++ ( with pkgs-unstable; [
    vesktop
  ]);
}