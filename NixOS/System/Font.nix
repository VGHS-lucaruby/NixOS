{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    corefonts
    vistafonts
    nerd-fonts.meslo-lg
    noto-fonts
    noto-fonts-emoji
    ibm-plex
  ];

  # fonts.fontconfig = { 
  #   enable = true; 
  #   defaultFonts = {
  #     serif = [ "IBM Plex Serif" ];
  #     sansSerif = [ "IBM Plex Sans" ];
  #     monospace = [ "IBM Plex Mono" ];
  #   };
  # };
}