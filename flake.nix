{
  
  description = "My first flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, mangowm, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
	modules = [
	  ./configuration.nix
	  mangowm.nixosModules.mango
	];
      }; 
    };
    homeConfigurations = {
      sam = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	      modules = [ 
          ./home.nix
        ];
      }; 
    };
  };

}
