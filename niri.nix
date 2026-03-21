{ pkgs, inputs, ... }: {

home-manager.users.icarus = {
	imports = [
		inputs.niri-flake.homeModules.niri
	];
	
	programs.niri = {
		package = inputs.niri-flake.packages.${pkgs.system}.niri;

		settings = {
			spawn-at-startup = [
				{ command = ["noctalia-shell"]; }
			];
		};
	};
};

}
