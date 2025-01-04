{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-howdy.url = "github:fufexan/nixpkgs/howdy";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.IdeaPad = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [ 
        ./Hosts/IdeaPad.nix
        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = inputs;
            backupFileExtension = "HomeManagerBackup";
            users = {
              lucaruby = import ./HomeManager/Users/lucaruby.nix;
            };
          };
        }
      ];
    };
    nixosConfigurations.TeamRed = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [ 
        ./Hosts/TeamRed.nix
        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = inputs;
            backupFileExtension = "HomeManagerBackup";
            users = {
              lucaruby = import ./HomeManager/Users/lucaruby.nix;
            };
          };
        }
      ];
    };
  };
}