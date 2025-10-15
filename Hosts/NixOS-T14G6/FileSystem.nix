{ config, ... }:

{
  boot.initrd.luks.devices."luks-12129042-5079-449e-9142-94594ac6d569".device = "/dev/disk/by-uuid/12129042-5079-449e-9142-94594ac6d569";
  boot.initrd.luks.devices."luks-89823609-764d-4124-8cef-6d2d4ef98f21".device = "/dev/disk/by-uuid/89823609-764d-4124-8cef-6d2d4ef98f21";


  fileSystems."/" =
    { label = "NIXOS-ROOT";
      fsType = "btrfs";
      options = [ "rw" "noatime" "discard=async" "compress=zstd:2" "space_cache=v2" "subvol=@" ];
    };  

  fileSystems."/boot" =
    { label = "NIXOS-BOOT";
      fsType = "vfat";
      options = [ "umask=0077"];
    };

  swapDevices = [ 
    { label = "NIXOS-SWAP"; } 
  ];

  services = {
    btrfs.autoScrub.enable = true;
    btrfs.autoScrub.interval = "weekly";
  };
}
