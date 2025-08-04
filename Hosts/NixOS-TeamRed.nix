{ config, ... }:

{
  imports =
  [
    ../NixOS
    
    # Desktop Enviroment
    ../NixOS/Desktop/Gnome.nix
  ];

  boot.initrd.luks.devices."luks-599dce7a-310f-40a3-aa83-9ff577fca026".device = "/dev/disk/by-uuid/599dce7a-310f-40a3-aa83-9ff577fca026";
  boot.initrd.luks.devices."luks-5e95c6a5-a7f4-4ae6-bc43-3631ec6b6c60".device = "/dev/disk/by-uuid/5e95c6a5-a7f4-4ae6-bc43-3631ec6b6c60";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "NixOS-TeamRed";
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
