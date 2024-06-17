{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lucaruby";
  home.homeDirectory = "/home/lucaruby";

  imports = [
    ../Modules/Alvr.nix
    # ../Modules/Cursor.nix
    ../Modules/FastFetch.nix
    ../Modules/GnomeDconf.nix
    # ../Modules/Gtk.nix
    ../Modules/Kitty.nix
    ../Modules/MangoHud.nix
    ../Modules/Spotify.nix
    ../Modules/SteamDLSpeedFix.nix
    ../Modules/Zsh.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    (vivaldi.override {
      commandLineArgs = [
        "--enable-features=VaapiVideoDecodeLinuxGL"
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
      ];
      enableWidevine = true;
    })
    vivaldi-ffmpeg-codecs
    (prismlauncher.override { jdks = [ zulu zulu17 zulu8 ]; })
    lutris
    vesktop
    betterdiscordctl
    transmission-gtk
    hfsprogs
    krita
    inkscape
    heroic
    BeatSaberModManager
  ];

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