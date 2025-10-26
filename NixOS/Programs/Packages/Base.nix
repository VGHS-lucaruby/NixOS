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
    sl
    htop
    btop-rocm
    glances
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