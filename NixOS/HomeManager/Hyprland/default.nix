{ config, inputs, ... }:

{
  imports = [
    inputs.vicinae.homeManagerModules.default
    ./Waybar
    ./Hypridle.nix
    ./Hyprland.nix
    ./Hyprlock.nix
    ./Hyprpaper.nix
    ./HyprpolkitAgent.nix
    ./Keybinds.nix
    ./Swaync.nix
    ./Vicinae.nix
    ./WindowRules.nix
  ];
}