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
    gamemode
    wine
    winetricks
    android-tools
  ];
}