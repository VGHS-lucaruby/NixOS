{ config, inputs, ... }:

{
  imports = [
    ./Hypridle.nix
    ./Hyprland.nix
    ./Hyprlock.nix
    ./Hyprpaper.nix
    ./HyprpolkitAgent.nix
    ./Keybinds.nix
    ./Swaync.nix
    ./WindowRules.nix
    ../Rofi
    ../Waybar
  ];
}