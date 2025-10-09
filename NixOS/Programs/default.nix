{ config, pkgs, pkgs-unstable, inputs, ... }:

{

  imports = [
    ./Packages
    ./Firefox.nix
    ./Gaming.nix
    ./Howdy.nix
    ./Mullvad.nix
    ./Overlays.nix
    ./SSH.nix
    ./Thunar.nix
  ];

  programs.adb.enable = true;
  programs.evolution.enable = true;
}