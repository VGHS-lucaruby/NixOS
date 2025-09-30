{ config, ... }:

{
  imports = [
    ./Cursor.nix
    ./Gnome.nix
    ./Gtk.nix
    ./Kitty.nix
    ./MangoHud.nix
    ./Options.nix
    ./SteamDLSpeedFix.nix
    ./Zsh.nix
  ];
}