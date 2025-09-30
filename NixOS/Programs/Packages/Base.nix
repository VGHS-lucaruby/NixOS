{ config, pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = ( with pkgs; [
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
    btop-rocm
    glances
    fastfetch
    hfsprogs
    sops
    rage
    age
    ssh-to-age
    qrencode
  ]) ++ ( with pkgs-unstable; [
    wineWowPackages.stagingFull
  ]);
}