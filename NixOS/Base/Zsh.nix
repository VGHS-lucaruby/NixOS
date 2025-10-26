{ config, pkgs, ... }:

let
  zshInit = with pkgs; writeShellApplication {
    name = "zshInitScript";
    runtimeInputs = [ fastfetch ];
    text = '' 
      set +u
      if [ -z "$XDG_CURRENT_DESKTOP" ] && [ "$XDG_VTNR" = 1 ]; then
        hyprland
      else
        fastfetch
      fi
    '';
  };
in 
{
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      enableLsColors = true;
      shellInit = "${zshInit}/bin/zshInitScript";
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