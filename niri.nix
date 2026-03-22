{ pkgs, config, inputs, ... }: let
  system = pkgs.stdenv.hostPlatform.system;
  noctalia-bin = "${inputs.noctalia.packages.${system}.default}/bin/noctalia-shell";
in {

programs.niri = {
	enable = true;
	package = inputs.niri.packages.${system}.niri-unstable;
	settings = {
		spawn-at-startup = [
			{ command = [ "${noctalia-bin}" ]; }
		];
	};
};

}
