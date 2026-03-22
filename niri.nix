{ pkgs, config, inputs, ... }: {

programs.niri = {
	package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
	settings = {
		spawn-at-startup = [
			{ command = [ "noctalia-shell" ]; }
		];
	};
};

}
