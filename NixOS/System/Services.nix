{ config, pkgs, ... }:

{
  services.printing.enable = true;

  services.btrfs.autoScrub.enable = true;
  services.btrfs.autoScrub.interval = "weekly";

  services.gvfs.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.teamviewer.enable = true;

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };
}