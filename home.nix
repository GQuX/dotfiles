{ config, pkgs, inputs, ... }: {

imports = [
	inputs.niri-flake.homeModules.niri
	inputs.noctalia.homeModules.default
];

home.username = "icarus";
home.homeDirectory = "/home/icarus";

programs.noctalia-shell.enable = true;
programs.niri = {
	enable = true;
	package = inputs.niri-flake.packages.${pkgs.system}.niri;
	settings = {
		spawn-at-startup = [
			{ command = [ "noctalia-shell" ]; }
		];
	};
};


#  xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;
#xdg.configFile."noctalia/settings.json".source = ./noctalia-settings.json;

home.stateVersion = "25.11";

}
