{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    #corefonts
    nerdfonts
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