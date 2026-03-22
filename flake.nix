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

outputs = { self, nixpkgs, home-manager, niri, noctalia, ... } @ inputs: {
	nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
		modules = [
			./configuration.nix

			home-manager.nixosModules.home-manager { home-manager = {
				useGlobalPkgs = true;
				useUserPackages = true;
				backupFileExtension = "backup";
			}; }
		];
	};
};

}
