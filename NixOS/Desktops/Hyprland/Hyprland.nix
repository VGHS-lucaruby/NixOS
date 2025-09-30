{config, pkgs, ...}: 

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;     
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.xkb.layout = "gb";

  environment.systemPackages = with pkgs; [
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
  ];

  # Hint Electon apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}