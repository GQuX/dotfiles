{ config, pkgs, username, ... }: {

programs.fish.enable = true;
programs.fish.shellAliases = {
	# quick jumps
	".."    = "cd ..";
	"..."   = "cd ../..";
	"...."  = "cd ../../..";
	"....." = "cd ../../../..";
	dots = "cd /home/${username}/.dotfiles/";

	# helpful
	rebuild = "sudo nixos-rebuild switch --flake .#thinkpad";
	nix-clean = "sudo nix-collect-garbage -d";

	# software
	anime = "ani-cli";
	discord = "vesktop";
};

}
