{ pkgs, config, inputs, ... }: {

programs.niri = {
	enable = true;
	package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
	settings = {
		spawn-at-startup = [
			{ command = [ "noctalia-shell" ]; }
		];
	};
};

# If adding it back causes the "Status 4" error again, it just means the noctalia-shell binary isn't in Niri's search path when it starts up. In that case, you'd change the command to use the absolute store path:
# command = [ "${inputs.noctalia.packages.${pkgs.system}.default}/bin/noctalia-shell" ];

}
