{

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	home-manage = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	niri = {
		url = "github:sodiboo/niri-flake";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	noctalia = {
		url = "github:noctalia-dev/noctalia-shell";
		inputs.nixpkgs.follows = "nixpkgs";
	};
};

outputs = { self, nixpkgs, home-manager, niri, noctalia, ... } @ inputs: let
	inherit (self) outputs;
	user = "icarus";
	userDescription = "it's icarus!";
in {
	nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
		specialArgs = {
			inherit inputs outputs;
			inherit user userDescription;
		};
		modules = [
			./configuration.nix # Core Module

			home-manager.nixosModules.home-manager { home-manager = {
				useGlobalPkgs = true;
				useUserPackages = true;
				backupFileExtension = "backup";
			}; }
		];
	};
};

}
