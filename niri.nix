{ pkgs, config, inputs, ... }: {

programs.niri = {
	package = inputs.niri.packages.${pkgs.system}.niri;
	settings = {
		spawn-at-startup = [
			{ command = [ "noctalia-shell" ]; }
		];
	};
};

}
