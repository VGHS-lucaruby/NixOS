{ config, pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = ( with pkgs; [
    whatsapp-for-linux
    telegram-desktop
  ]) ++ ( with pkgs-unstable; [
    vesktop
  ]);
}