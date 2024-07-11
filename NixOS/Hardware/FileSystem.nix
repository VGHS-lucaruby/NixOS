{ config, ... }:

{
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
}