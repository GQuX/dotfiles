{ pkgs, inputs, outputs, user, userDescription, ... }: {

imports = [ ];

users.users.${user} = {
	description = "${userDescription}";
	isNormalUser = true;
	extraGroups = [ "wheel" "networkmanager" ];
	shell = pkgs.fish;
};

home-manager = {
	verbose = true;
	extraSpecialArgs = {
		inherit inputs outputs;
		inherit user userDescription;
	};

	users.${user} = {
		imports = [
			./niri
		];

		home = {
			stateVersion = "25.11";
			username = "${user}";
		};
	};
};

}
