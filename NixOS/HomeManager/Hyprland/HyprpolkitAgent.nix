{ config, lib, osConfig, ... }:

{
  config = lib.mkIf (osConfig.modDesktop.name == "Hyprland") {
    services.hyprpolkitagent ={
      enable = true;
    };
  };
}