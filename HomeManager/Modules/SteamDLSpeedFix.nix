{ config, ...}:

{
  home.file.steam_downloadfix = {
   target = "${config.home.homeDirectory}/.steam/steam/steam_dev.cfg";
   source = ../../Configurations/SteamDLSpeedFix.cfg;
  };
}