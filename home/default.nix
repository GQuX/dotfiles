{ pkgs, inputs, username, displayName, homeDirectory, ... }: {

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
	};

	users.${username} = {
		imports = [
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
