{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
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

  outputs = { self, nixpkgs, home-manager, nixpkgs-stable, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in
  {
    nixosConfigurations.IdeaPad = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs; inherit pkgs-stable;};
      modules = [ 
        ./Hosts/IdeaPad.nix
        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs; inherit pkgs-stable;};
            backupFileExtension = "HomeManagerBackup";
            users = {
              lucaruby = import ./HomeManager/Users/lucaruby.nix;
              kuma = import ./HomeManager/Users/kuma.nix;
            };
          };
        }
      ];
    };
    nixosConfigurations.TeamRed = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs; inherit pkgs-stable;};
      modules = [ 
        ./Hosts/TeamRed.nix
        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs; inherit pkgs-stable;};
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