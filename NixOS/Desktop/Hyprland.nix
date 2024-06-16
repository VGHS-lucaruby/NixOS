{config, pkgs, ...}: 

{
  imports =
  [
    ../System/Polkit.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.hidpi = true;
    xwayland.enable = true;
    withSystemd = true;     
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
  };

  environment.systemPackages = with pkgs; [
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
  ];

  # Hint Electon apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    autostart.enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}