{ config, ... }:

{
  boot.initrd.luks.devices."luks-599dce7a-310f-40a3-aa83-9ff577fca026".device = "/dev/disk/by-uuid/599dce7a-310f-40a3-aa83-9ff577fca026";
  boot.initrd.luks.devices."luks-5e95c6a5-a7f4-4ae6-bc43-3631ec6b6c60".device = "/dev/disk/by-uuid/5e95c6a5-a7f4-4ae6-bc43-3631ec6b6c60";

  fileSystems."/" =
    { label = "NIXOS-ROOT";
      fsType = "btrfs";
      options = [ "rw" "noatime" "discard=async" "compress=zstd:2" "space_cache=v2" "subvol=@" ];
    };  

  fileSystems."/home" =
    { label = "NIXOS-ROOT";
      fsType = "btrfs";
      options = ["rw" "noatime" "discard=async" "compress=zstd:2" "space_cache=v2" "subvol=@home" ];
    };
  
  fileSystems."/nix" =
    { label = "NIXOS-ROOT";
      fsType = "btrfs";
      options = ["rw" "noatime" "discard=async" "compress=zstd:2" "space_cache=v2" "subvol=@nix" ];
    };
  
  fileSystems."/games" =
    { label = "NIXOS-ROOT";
      fsType = "btrfs";
      options = ["rw" "noatime" "discard=async" "compress=zstd:2" "space_cache=v2" "subvol=@games" ];
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
