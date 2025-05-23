{ config, lib, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initContent = "fastfetch";
      shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color";
        clr = "clear";
        updflake = "sudo nix flake update ~/.BuildFiles/NixOS";
        upd = "sudo nixos-rebuild switch --flake ~/.BuildFiles/NixOS/";
        updb = "sudo nixos-rebuild boot --flake ~/.BuildFiles/NixOS/";
      };
      oh-my-zsh = {
        enable = true;
        theme = "gallois";
        plugins = [
          "git"
          "history"
        ];
      };
    };
  };
  home.file.fastfetch_config = {
    target = "${config.home.homeDirectory}/.config/fastfetch/config.jsonc";
    source = ../../Configurations/FastFetch.jsonc;
  };
}