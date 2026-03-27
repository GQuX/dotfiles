{ self, inputs, ... }: {
perSystem = { pkgs, ... }: {

packages.fish = inputs.wrappers.lib.wrapPackage {
	enable = true;
	shellAliases = {
			# quick jumps
		".."    = "cd ..";
		"..."   = "cd ../..";
		"...."  = "cd ../../..";
		"....." = "cd ../../../..";
		dots = "cd /home/icarus/.dotfiles/";

		# helpful
		rebuild = "git add . && sudo nixos-rebuild switch --flake .#thinkpad";
		test-rebuild = "git add . && sudo nixos-rebuild test --flake .#thinkpad";
		dry-rebuild = "nixos-rebuild build --flake .#thinkpad";
		nix-clean = "sudo nix-collect-garbage -d";

		# software
		anime = "ani-cli";
		discord = "vesktop";
	};
};

}; }
