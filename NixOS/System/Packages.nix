{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vulkan-tools
    glxinfo
    git
    iperf
    wget
    pciutils
    inetutils
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
    gamescope
    vivaldi-overlayed
    vivaldi-ffmpeg-codecs
    pokemmo-installer
  ];
}