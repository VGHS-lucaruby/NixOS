{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-howdy.url = "github:fufexan/nixpkgs/howdy";

    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.NixOS-IdeaPad = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [ 
        ./Hosts/NixOS-IdeaPad.nix
        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            backupFileExtension = "HomeManagerBackup";
            users = {
              lucaruby = import ./HomeManager/Users/lucaruby.nix;
              kuma = import ./HomeManager/Users/kuma.nix;
            };
          };
        }
      ];
    };
    nixosConfigurations.NixOS-TeamRed = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [ 
        ./Hosts/NixOS-TeamRed.nix
        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            backupFileExtension = "HomeManagerBackup";
            users = {
              lucaruby = import ./HomeManager/Users/lucaruby.nix;
              kuma = import ./HomeManager/Users/kuma.nix;
            };
          };
        }
      ];
    };
  };
}