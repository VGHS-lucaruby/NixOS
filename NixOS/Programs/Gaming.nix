{ config, pkgs, pkgs-unstable, ... }:

{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  
  programs.alvr = {
    enable = true;
    openFirewall = true;
    package = pkgs-unstable.alvr;
  };

  programs.gamescope.enable = true;

}