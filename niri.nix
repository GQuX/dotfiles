{ pkgs, config, inputs, ... }: let
  #system = pkgs.stdenv.hostPlatform.system;
  #noctalia-pkg = inputs.noctalia.packages.${system}.default;
in {

programs.niri = {
	enable = true;
	#package = inputs.niri.packages.${system}.niri-unstable;
	settings = {
		spawn-at-startup = [
			{ command = [ "firefox" ]; }
			#{ command = [ "noctalia-shell" ]; }
		];
	};
};

}
