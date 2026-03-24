{

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	home-manager = {
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
	username = "icarus";
	displayName = "${username}";
	homeDirectory = "/home/${username}";
	avatar = "${homeDirectory}/.dotfiles/assets/avatars/link.png";
	wallpaper = "${homeDirectory}/.dotfiles/assets/wallpapers/rammiel.png";
in {
	nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
		specialArgs = {
			inherit inputs;
			inherit homeDirectory;
			inherit username displayName;
			inherit avatar wallpaper;
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
