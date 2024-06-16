{ config, ... }:

{
  boot.initrd.luks.devices."luks-599dce7a-310f-40a3-aa83-9ff577fca026".device = "/dev/disk/by-uuid/599dce7a-310f-40a3-aa83-9ff577fca026";
  boot.initrd.luks.devices."luks-5e95c6a5-a7f4-4ae6-bc43-3631ec6b6c60".device = "/dev/disk/by-uuid/5e95c6a5-a7f4-4ae6-bc43-3631ec6b6c60";
}
