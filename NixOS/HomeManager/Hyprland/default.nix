{ config, ... }:

{
  imports = [
    ./Waybar
    ./Hyprland.nix
    ./Hyprpaper.nix
    ./HyprpolkitAgent.nix
    ./Keybinds.nix
    ./Rofi.nix
    ./WindowRules.nix
  ];
}