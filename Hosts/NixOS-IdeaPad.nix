{ config, ... }:

{
  imports =
  [
    # Hardware
    ../NixOS/Hardware/BootLoader.nix
    ../NixOS/Hardware/FileSystem.nix
    ../NixOS/Hardware/Firmware.nix

    ../NixOS/Hardware/Luks-IdeaPad.nix
    # ../NixOS/Hardware/Luks-TeamRed.nix
    ../NixOS/Hardware/Modules.nix

    # Networking
    ../NixOS/Networking/Firewall.nix
    ../NixOS/Networking/Network.nix

    # System
    ../NixOS/System/Font.nix
    ../NixOS/System/GeneralSettings.nix
    #../NixOS/System/Howdy.nix
    ../NixOS/System/NixSettings.nix
    ../NixOS/System/Overlays.nix
    ../NixOS/System/Packages.nix
    ../NixOS/System/PackageSettings.nix
    ../NixOS/System/Pipewire.nix
    ../NixOS/System/Plymouth.nix
    ../NixOS/System/Programs.nix
    ../NixOS/System/Services.nix
    ../NixOS/System/Stylix.nix
    ../NixOS/System/Users.nix
    ../NixOS/System/Virtualization.nix
    ../NixOS/System/Zsh.nix
    
    # Desktop Enviroment
    ../NixOS/Desktop/Gnome.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "NixOS-IdeaPad";
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
