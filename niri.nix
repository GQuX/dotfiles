{ pkgs, config, inputs, ... }: {

programs.niri = {
	enable = true;

	# Use the package from the flake input
	# We use 'pkgs.system' to make it dynamic based on your machine
	package = inputs.niri.packages.${pkgs.system}.niri-unstable;

	settings = {
		# Your configuration goes here
		spawn-at-startup = [
			{ command = [ "firefox" ]; }
			{ command = [ "noctalia-shell" ]; }
		];

		# Example: Define a terminal bind so you don't get locked out!
		binds = with config.lib.niri.actions; {
			"Mod+Y".action = spawn "foot";
		};
	};
};

}
