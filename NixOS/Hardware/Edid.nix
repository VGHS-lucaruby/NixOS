{ config, pkgs, ...}:

{
  boot = {
    kernelPatches = [ {
      name = "edid-loader-fix-config";
      patch = null;
      extraConfig = ''
        FW_LOADER y
      '';
    } ];	
  };

  hardware.firmware = [
    (
      pkgs.runCommand "edid.bin" { } ''
        mkdir -p $out/lib/firmware/edid
        cp ${../../Configurations/edid.bin} $out/lib/firmware/edid/edid.bin
      ''
    )
  ];
  
  boot.kernelParams = ["drm_kms_helper.edid_firmware=edid/edid.bin"];
}