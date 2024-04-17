{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfiguration."crowll" =
        inputs.home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [./home.nix ];
	  extraSpecialArgs = { inherit inputs; };
	};
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
	    	./nixos/configuration.nix
		inputs.home-manager.nixosModules.default
            ];
        };
      };
    };
}
