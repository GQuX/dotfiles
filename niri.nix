{ pkgs, config, inputs, ... }: {

programs.niri = {
	package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.default;
	settings = {
		spawn-at-startup = [
			{ command = [ "noctalia-shell" ]; }
		];
	};
};

}
