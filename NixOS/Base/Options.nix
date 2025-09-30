{ config, lib, ... }:

{
  options = with lib; {
    modDesktop.name = mkOption {
      type = with types; uniq str;
      description = "Name Of Desktop You Want Activated"; 
    };
    modDesktop.background = mkOption {
      type = with types; uniq path;
      description = "Path to Desktop Background Image"; 
    };
    modHowdy.enable = mkEnableOption "Enable Howdy Login";
  };
}