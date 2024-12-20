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
    mpv
    sl
    htop
    bottom
    glances
    fastfetch
    gamemode
    winetricks
    android-tools
  ];
}