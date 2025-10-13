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
      serif = [ "IBM Plex Serif" "Symbols Nerd Font" ];
      sansSerif = [ "IBM Plex Sans" "Symbols Nerd Font" ];
      monospace = [ "IBM Plex Mono" "Symbols Nerd Font" ];
    };
  };
}