{ config, pkgs, inputs, ... }:

{
  programs.steam.enable = true;

  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ 
        icu
        gcc_multi
        fontconfig
        vulkan-headers
        vulkan-loader
      ] ++ (
      with xorg; [
        libICE
        libSM
        libX11
      ]);
  };

  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16" # nehko
  ];

  # hardware.xone.enable = true;

  programs.evolution.enable = true;
}