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
    "olm-3.2.16"
  ];

  imports = [
    # For NixOS
    inputs.spicetify-nix.nixosModules.default
  ];

  # programs.spicetify =
  # let
  #   spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  # in
  # {
  #   enable = true;
  #   theme = spicePkgs.themes.catppuccin;
  #   colorScheme = "Frappé";
  #   enabledExtensions = with spicePkgs.extensions; [
  #     shuffle
  #     fullAlbumDate
  #     history
  #     autoSkip
  #   ];
  # };

  hardware.xone.enable = true;
}