{ config, ... }:

{
  imports =
  [
    ../NixOS
    ../NixOS/System/Howdy.nix
    # Desktop Enviroment
    ../NixOS/Desktop/Gnome.nix
  ];

  boot.initrd.luks.devices."luks-1da6ce39-dd24-49c7-bc57-10b534891832".device = "/dev/disk/by-uuid/1da6ce39-dd24-49c7-bc57-10b534891832";
  boot.initrd.luks.devices."luks-f437b704-2bb3-464b-b462-722a4ae5cf36".device = "/dev/disk/by-uuid/f437b704-2bb3-464b-b462-722a4ae5cf36";

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
