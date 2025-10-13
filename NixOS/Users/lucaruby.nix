{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lucaruby";
  home.homeDirectory = "/home/lucaruby";

  modDesktopUser.background = pkgs.fetchurl {
    url = "https://pbs.twimg.com/media/Gzdw3ZCW4AE_T_k?format=jpg&name=4096x4096";
    sha256 = "sha256-9neGXTNPaiLJ5+J+qkgZLpHoccVmdFPXpW492ypLJ/A=";
  };

  programs.vscode = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}