{ config, lib, pkgs, ... }: 

{
  config = lib.mkIf (config.modDesktop.name == "Hyprland") {
    programs = {
      hyprland = {
        enable = true;     
      };
      nm-applet.enable = true;
    };

    environment.systemPackages = with pkgs; [
      wayland-protocols
      wayland-utils
      wl-clipboard
      wlroots
      overskride
    ];

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    };
  };
}