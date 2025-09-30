{ config, pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = ( with pkgs; [
    gamemode
    winetricks
    gamescope
    pokemmo-installer
    prism-overlayed    
    lutris-overlayed
    heroic
    bs-manager
    osu-lazer-bin
  ]) ++ ( with pkgs-unstable; [
    ryubing
    cemu
  ]);
}