{ config, ... }:

{
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
  };

  home.file.mangohud = {
    target = "${config.home.homeDirectory}/.config/MangoHud/MangoHud.conf";
    source = ../../Configurations/MangoHud.conf;
  };
}
