{ pkgs, inputs, username, displayName, homeDirectory, avatar, wallpaper, ... }: {

imports = [ ];

users.users.${username} = {
	description = "${displayName}";
	isNormalUser = true;
	extraGroups = [ "wheel" "networkmanager" ];
	shell = pkgs.fish;
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
