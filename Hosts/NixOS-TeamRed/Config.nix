{ config, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  modDesktop = {
    name = "Hyprland";
    display = "DP-1, 2560x1440@144, 0x0, 1";
  };

  imports = [
    ./FileSystem.nix
  ];

  modSecureBoot.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
