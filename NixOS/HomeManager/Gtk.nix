{ config, pkgs, ... }:

{
	gtk = {
  	enable = true;
    theme = {
    	name = "Nordic";
      package = pkgs.nordic;
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