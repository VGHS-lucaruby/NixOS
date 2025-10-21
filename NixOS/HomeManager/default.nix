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
    ./Media.nix
    ./Options.nix
    ./SteamDLSpeedFix.nix
    ./XDG.nix
    ./Zsh.nix
  ];
}