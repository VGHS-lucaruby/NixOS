{ config, pkgs, pkgs-unstable, inputs, ... }:

{

  imports = [
    ./Packages
    ./Firefox.nix
    ./Gaming.nix
    ./Howdy.nix
    ./Overlays.nix
    ./SSH.nix
  ];

  programs.adb.enable = true;
  programs.evolution.enable = true;
}