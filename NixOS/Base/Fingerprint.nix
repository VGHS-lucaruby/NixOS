{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.modFingerprint.enable {
    systemd.services.fprintd = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "simple";
    };
  
    services.fprintd.enable = true;
    services.fprintd.tod.enable = true;
    # ...and use one of the next four drivers
    services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix; # Goodix driver module
    # services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix-550a; # Goodix 550a driver (from Lenovo)
  };
}