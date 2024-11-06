{ config, pkgs, inputs, ... }:

{
  programs.steam.enable = true;

  programs.adb.enable = true;

  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
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
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "Frappé";
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      fullAlbumDate
      history
      autoSkip
    ];
  };

  hardware.xone.enable = true;
}