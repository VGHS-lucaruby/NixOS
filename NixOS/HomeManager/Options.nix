{ config, lib, ... }:

{
  options = with lib; {
    modDesktopUser.background = mkOption {
      type = with types; uniq path;
      description = "Path to Desktop Background Image"; 
    };
  };
}