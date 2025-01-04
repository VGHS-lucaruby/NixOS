{ config, pkgs, inputs, ... }:

{
  programs.steam.enable = true;

  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16" # nehko
    "dotnet-runtime-wrapped-7.0.20" # bsmm
    "dotnet-runtime-7.0.20" # bsmm
    "dotnet-wrapped-combined" # bsmm
    "dotnet-combined" # bsmm
    "dotnet-sdk-wrapped-7.0.410" # bsmm
    "dotnet-sdk-7.0.410" # bsmm
    "dotnet-sdk-wrapped-6.0.428" # bsmm
    "dotnet-sdk-6.0.428" # bsmm
  ];

  imports = [
    # For NixOS
    inputs.spicetify-nix.nixosModules.default
  ];

  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in
  {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      fullAlbumDate
      history
      autoSkip
    ];
  };

  hardware.xone.enable = true;
}