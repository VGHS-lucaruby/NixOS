{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      enableLsColors = true;
      shellInit = "fastfetch";
      histSize = 1000;
      shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color";
        clr = "clear";
        start = "exec uwsm start default";
        updflake = "sudo nix flake update ~/.BuildFiles/NixOS";
        upd = "sudo nixos-rebuild switch --flake ~/.BuildFiles/NixOS/";
        updb = "sudo nixos-rebuild boot --flake ~/.BuildFiles/NixOS/";
      };
      ohMyZsh = {
        enable = true;
        theme = "gallois";
        plugins = [
          "git"
          "history"
        ];
      };
    };
  };
}