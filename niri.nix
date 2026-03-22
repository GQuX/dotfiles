{ pkgs, config, inputs, niri-flake, ... }: {

programs.niri.enable = true;

home-manager.users.icarus = {
	imports = [
		inputs.niri-flake.homeModules.niri
		inputs.noctalia.homeModules.default
	];

	programs.niri.settings = {
		spawn-at-startup = [
			{ command = [ "noctalia-shell" ]; }
		];
	};

	programs.noctalia-shell.enable = true;
};

}
