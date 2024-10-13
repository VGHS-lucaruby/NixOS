{ config, pkgs, ... }: 
 
{
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "2E3440";
      base01 = "3B4252";
      base02 = "434C5E";
      base03 = "4C566A";
      base04 = "D8DEE9";
      base05 = "E5E9F0";
      base06 = "ECEFF4";
      base07 = "EEEFF9";
      base08 = "BF616A";
      base09 = "EE9D5B";
      base0A = "F5CC7A";
      base0B = "9AB87F";
      base0C = "8FBCBB";
      base0D = "5B85B8";
      base0E = "CDB4DB";
      base0F = "FFC8DD";
    };

    image = pkgs.fetchurl {
      url = "https://live.staticflickr.com/65535/52753759673_1df3284e8b_o_d.jpg";
      sha256 = "2f9d4387db6d7b598170eacfe6a6ee59486feb5fa3411bacab39ff02996c47bc";
    };

    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Serif";
      };
      sansSerif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Sans";
      };
      monospace = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Mono";
      };
    };

    cursor = {
      name = "Nordzy-cursors-white";
      package = pkgs.nordzy-cursor-theme;
      size = 24;
    };

    fonts.sizes = {
      applications = 12;
      terminal = 10;
      desktop = 12;
      popups = 12;
    };
  
    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };
  };
}