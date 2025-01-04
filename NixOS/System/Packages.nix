{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vulkan-tools
    glxinfo
    git
    iperf
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
    gamescope
    (vivaldi.override {
      commandLineArgs = [
        "--use-gl=angle" 
        "--use-angle=vulkan" 
        "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE" 
        "--ignore-gpu-blocklist" 
        "--disable-gpu-driver-bug-workaround"
      ];
      enableWidevine = true;
    })
    vivaldi-ffmpeg-codecs
  ];
}