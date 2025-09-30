{ config, lib, ... }:

{
  options = with lib; {
    modDesktop.background = mkOption {
      type = with types; uniq path;
      description = "Path to Desktop Background Image"; 
    };
  };
}