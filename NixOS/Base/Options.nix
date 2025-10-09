{ config, lib, ... }:

{
  options = with lib; {
    modDesktop.name = mkOption {
      type = with types; uniq str;
      description = "Name Of Desktop You Want Activated"; 
    };
    modDesktop.display = mkOption {
      type = with types; uniq str;
      description = "Display configuration string"; 
    };
    modHowdy.enable = mkEnableOption "Enable Howdy Login";
  };
}