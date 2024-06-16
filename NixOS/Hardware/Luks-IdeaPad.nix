{ config, ... }:

{
  boot.initrd.luks.devices."luks-1da6ce39-dd24-49c7-bc57-10b534891832".device = "/dev/disk/by-uuid/1da6ce39-dd24-49c7-bc57-10b534891832";
  boot.initrd.luks.devices."luks-f437b704-2bb3-464b-b462-722a4ae5cf36".device = "/dev/disk/by-uuid/f437b704-2bb3-464b-b462-722a4ae5cf36";
}
