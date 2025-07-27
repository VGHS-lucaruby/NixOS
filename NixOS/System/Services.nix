{ config, pkgs, ... }:

{
  systemd.tmpfiles.rules = [ "d /var/lib/openwakeword/models 0777 wyoming-openwakeword wyoming-openwakeword - -" ];
  services = {
    printing.enable = true;

    btrfs.autoScrub.enable = true;
    btrfs.autoScrub.interval = "weekly";

    gvfs.enable = true;

    gnome.gnome-keyring.enable = true;

    teamviewer.enable = true;

    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };

    ollama = {
      enable = false;
      acceleration = "rocm";
      rocmOverrideGfx = "11.0.0";
      host = "0.0.0.0";
      # environmentVariables = {
      #   OLLAMA_DEBUG = "1";
      # };
      loadModels = [ 
        "llama3.1"
        "llama3.2"
        "deepseek-r1:1.5b"
        "deepseek-r1:7b"
        "rns96/deepseek-R1-ablated:f32_Q80"
      ];
    };
    
    open-webui.enable = true;

    wyoming = {
      piper.servers."PiperMain" = {
        enable = true;
        uri = "tcp://0.0.0.0:10200";
        voice = "en_GB-jenny_dioco-medium";
      };
      openwakeword = {
        enable = true;
        customModelsDirectories = [ "/var/lib/openwakeword/models" ];
        preloadModels = [
          "ok_nabu"
        ];
      };
      faster-whisper.servers."WhisperMain" = {
        enable = true;
        language = "auto";
        model = "small-int8";
        uri = "tcp://0.0.0.0:10300";
      };
    };    
  };
}