{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    krita
    inkscape
    blender
    qbittorrent
    scrcpy
    libreoffice
    foliate
  ];
}