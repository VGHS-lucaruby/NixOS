{ config, pkgs, ... }:

{
  home.file.alvr = {
   target = "${config.home.homeDirectory}/.config/alvr/session.json";
   source = ../../Configurations/alvr.json;
  };
}