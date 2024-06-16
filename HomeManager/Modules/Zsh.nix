{ config, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtraFirst = "fastfetch";
      shellAliases = {
        ls = "ls --color=auto";
        grep = "grep --color";
        clr = "clear";
        updflake = "sudo nix flake update ~/.BuildFiles/NixOS";
        updlaptop = "sudo nixos-rebuild switch --flake ~/.BuildFiles/NixOS/#IdeaPad";
        updblaptop = "sudo nixos-rebuild boot --flake ~/.BuildFiles/NixOS/#IdeaPad";
        upddesktop = "sudo nixos-rebuild switch --flake ~/.BuildFiles/NixOS/#TeamRed";
        updbdesktop = "sudo nixos-rebuild boot --flake ~/.BuildFiles/NixOS/#TeamRed";
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
}