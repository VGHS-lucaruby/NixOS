{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-howdy.url = "github:fufexan/nixpkgs/howdy";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae = {
      url = "github:vicinaehq/vicinae";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, lanzaboote, vicinae, ... } @inputs:
    let
      system = "x86_64-linux";
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      nixosConfigurations = nixpkgs.lib.foldl' (
        configs: hostname:
        configs
        // {
          "${hostname}" = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs hostname pkgs-unstable; };
            modules = [
              ./NixOS
              ./Hosts/${hostname}/Config.nix
              lanzaboote.nixosModules.lanzaboote

              home-manager.nixosModules.home-manager {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = { inherit inputs hostname pkgs-unstable; };
                  backupFileExtension = "HomeManagerBackup";
                  sharedModules = [
                    ./NixOS/HomeManager 
                  ];
                  # todo: Make import based on users directory. 
                  users = {
                    lucaruby = import ./NixOS/Users/lucaruby.nix;
                  };
                };
              }
            ];
          };
        }
      ) 
      {} (nixpkgs.lib.attrsets.mapAttrsToList (name: value: name) (builtins.readDir ./Hosts));
    };
}