{ config, pkgs, ... }:

{
	gtk = {
  	enable = true;
    theme = {
    	name = "Nordic";
      package = pkgs.nordic;
    };
    cursorTheme = {
      name = "Nordzy-cursors-white";
      package = pkgs.nordzy-cursor-theme;
      size = 24;
    };
    iconTheme = {
        name = "Nordzy";
        package = pkgs.nordzy-icon-theme;
    };
    font = {
      name = "IBM Plex Sans";
      package = pkgs.ibm-plex;
      size = 12;
    };
  };
}