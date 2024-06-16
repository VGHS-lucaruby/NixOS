{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    # theme = "Nord";
    # font = {
    #   name = "IBM Plex Mono Medm";
    #   size = 10;
    #   package = pkgs.ibm-plex;
    # };
  };
}
