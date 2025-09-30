{ config, lib, ... }:

{
  home.file.fastfetch_config = {
    target = "${config.home.homeDirectory}/.config/fastfetch/config.jsonc";
    source = ../../Configurations/FastFetch.jsonc;
  };
}