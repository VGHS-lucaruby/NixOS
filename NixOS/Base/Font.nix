{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    corefonts
    vistafonts
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.symbols-only
    ibm-plex
  ];

  fonts.fontconfig = { 
    enable = true; 
    defaultFonts = {
      serif = [ "IBM Plex Serif" ];
      sansSerif = [ "IBM Plex Sans" ];
      monospace = [ "IBM Plex Mono" ];
    };
  };
}