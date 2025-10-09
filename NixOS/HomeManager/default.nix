{ config, ... }:

{
  imports = [
    ./Cursor.nix
    ./Dconf.nix
    ./Gnome.nix
    ./Gtk.nix
    ./Hyprland
    ./Kitty.nix
    ./MangoHud.nix
    ./Options.nix
    ./SteamDLSpeedFix.nix
    ./Zsh.nix
  ];
}