{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  imports = [
    ./Base.nix
    ./Gaming.nix
    ./Messaging.nix
    ./Productivity.nix
  ];
}