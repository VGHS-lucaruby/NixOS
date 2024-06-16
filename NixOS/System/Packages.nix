{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vulkan-tools
    glxinfo
    git
    wget
    pciutils
    remmina
    vlc
    sl
    htop
    bottom
    glances
    fastfetch
    mangohud
    goverlay
    gamemode
    plymouth
    vscodium
    android-tools
  ];
}