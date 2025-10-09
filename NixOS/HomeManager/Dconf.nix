{ config, lib, osConfig, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };

      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org.gnome.desktop.privacy".remember-recent-files = "false";
    };
  };
}