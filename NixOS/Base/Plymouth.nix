{ config, pkgs, ... }:

{
  boot = {
    kernelParams = ["quiet"];
    plymouth = {
      enable = true;
      theme = "blahaj";
      themePackages = with pkgs; [
        plymouth-blahaj-theme
      ];
    };
  };
}