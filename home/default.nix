{ pkgs, inputs, username, displayName, homeDirectory, avatar, wallpaper, ... }: {

imports = [ ];

users.users.${username} = {
	description = "${displayName}";
	isNormalUser = true;
	extraGroups = [ "wheel" "networkmanager" ];
	shell = pkgs.fish;
};

xdg.mime.enable = true;
xdg.mime.defaultApplications = {
	"text/html" = ["brave-browser.desktop"];
	"x-scheme-handler/http" = ["brave-browser.desktop"];
	"x-scheme-handler/https" = ["brave-browser.desktop"];
};

home-manager = {
	verbose = true;
	extraSpecialArgs = {
		inherit inputs;
		inherit username displayName;
		inherit avatar wallpaper;
	};

	users.${username} = {
		imports = [
			./fish.nix
			./niri
		];

		home = {
			stateVersion = "25.11";
			username = "${username}";
			homeDirectory = "${homeDirectory}";
		};
	};
};

}
