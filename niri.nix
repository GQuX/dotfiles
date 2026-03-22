{ pkgs, config, inputs, ... }: {

home-manager.users.icarus = {
	programs.niri = {
		package = niri;
		settings = {
			spawn-at-startup = [
				{ command = [ "noctalia-shell" ]; }
			];
		};
	};
};

}
