{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    # theme = "Nord";
    # font = {
    #   name = "IBM Plex Mono Medm";
    #   size = 10;
    #   package = pkgs.ibm-plex;
    # };
    shellIntegration.enableZshIntegration = true;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      confirm_os_window_close = 0;
    };
  };
}
