{ pkgs, config, inputs, niri-flake, ... }: {

programs.niri.enable = true;

home-manager.users.icarus = {
	programs.niri.settings = {
		spawn-at-startup = [
			{ command = [ "${inputs.noctalia.packages.${pkgs.system}.default}/bin/noctalia-shell" ]; }
		];
	};

	programs.noctalia-shell.enable = true;
};

}
