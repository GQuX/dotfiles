{ config, pkgs, ... }: {

programs.niri.settings.binds = with config.lib.niri.actions; {
	"Mod+Shift+Slash".action = show-hotkey-overlay; # ?

	"Mod+Q".action = close-window;
	"Mod+Q".repeat = false;

	"Mod+Return".action = spawn "${pkgs.kitty}/bin/kitty";
	"Mod+Return".repeat = false;
	"Mod+K".action = spawn "${kdePackages.kate}/bin/kate";
	"Mod+K".repeat = false;

	# Navigation
	"Mod+Left".action  = focus-column-left;
	"Mod+Right".action = focus-column-right;
	"Mod+Up".action   = focus-workspace-up;
	"Mod+Down".action = focus-workspace-down;

	# Move
	"Mod+Shift+Left".action  = move-column-left;
	"Mod+Shift+Right".action = move-column-right;
	"Mod+Shift+Up".action   = move-column-to-workspace-up;
	"Mod+Shift+Down".action = move-column-to-workspace-down;

	# Resize
	"Mod+F".action = maximize-column;
	"Mod+Shift+F".action = fullscreen-window;
	"Mod+Minus".action = set-column-width "-10%";
	"Mod+Equal".action = set-column-width "+10%";
	"Mod+Shift+Minus".action = set-window-height "-10%";
	"Mod+Shift+Equal".action = set-window-height "+10%";
};

}
