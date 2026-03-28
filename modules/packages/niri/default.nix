{ self, inputs, ... }: { flake.nixosModules.niri = { pkgs, lib, ... }: { programs.niri = {
	enable = true;
	package = self.packages.${pkgs.stdenv.hostPlatform.system}.thinkpadNiri;
}; };

perSystem = { pkgs, lib, self', ... }: {

packages.thinkpadNiri = inputs.wrapper-modules.wrappers.niri.wrap {
inherit pkgs;

settings = {
	spawn-at-startup = [
		(lib.getExe self'.packages.thinkpadNoctalia)
	];

	xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

	input.keyboard.xkb.layout = "us, ua";

	layout.gaps = 5;

	binds = {
		"Mod+Return".spawn-sh = lib.getExe pkgs.kitty;

		"Mod+Q".close-window = null;
		"Mod+Shift+Slash".show-hotkey-overlay = null;

		"Mod+L".spawn-sh = "${lib.getExe self'.packages.thinkpadNoctalia} ipc call launcher toggle";
		"Mod+K".spawn-sh = lib.getExe' pkgs.kdePackages.kate "kate";

		# "Mod+S".action = spawn "${pkgs.brave}/bin/brave";
		# "Mod+S".repeat = false;
		# "Print".action = spawn "sh" "-c" "${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.swappy}/bin/swappy -f -";
		# "Print".repeat     = false;
		# "Mod+Print".action = spawn "sh" "-c" "${pkgs.grim}/bin/grim ~/Pictures/$(${pkgs.coreutils}/bin/date +%Y%m%d_%H%M%S).png";
		# "Mod+Print".repeat = false;

		# Navigation
		"Mod+Left".focus-column-left = null;
		"Mod+Right".focus-column-right = null;
		"Mod+Up".focus-workspace-up = null;
		"Mod+Down".focus-workspace-down = null;

		# Move
		"Mod+Shift+Left".move-column-left   = null;
		"Mod+Shift+Right".move-column-right = null;
		"Mod+Shift+Up".move-column-to-workspace-up     = null;
		"Mod+Shift+Down".move-column-to-workspace-down = null;

		# Resize
		"Mod+F".maximize-column = null;
		"Mod+Shift+F".fullscreen-window = null;
		"Mod+Minus".set-column-width = "-10%";
		"Mod+Equal".set-column-width = "+10%";
		"Mod+Shift+Minus".set-window-height = "-10%";
		"Mod+Shift+Equal".set-window-height = "+10%";
	};
};

# home.file.".cache/noctalia/wallpapers.json".text = builtins.toJSON {
# defaultWallpaper = "${wallpaper}";
# wallpapers = {
# "DP-1" = "${wallpaper}";

}; }; }
