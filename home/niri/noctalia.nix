{ pkgs, inputs, avatar, ... }: {

imports = [ inputs.noctalia.homeModules.default ];

programs.noctalia-shell.enable = true;

# Settings
programs.noctalia-shell.settings = {
	settingsVersion = 46;
	colorSchemes.predefinedScheme = "Monochrome";
	location.name = "Chicago, Illinois";
	general = {
		avatarImage = "${avatar}";
		radiusRatio = 0.2;
	};
	bar = {
		position = "left";
		barType = "framed";
		frameThickness = 10;
		frameRadius    = 20;
		showCapsule = false;
		widgets.top = [
			{ id = "Launcher"; useDistroLogo = true; enableColorization = true; iconColor = "${programs.noctalia-shell.colors.mTertiary}"; }
		];
	};
};

# Color Palette
programs.noctalia-shell.colors = { # make this a json path later
	mSurface     = "#0e151d"; # bar & border
	mOnSurface   = "#b3c1d3"; # primary text color
	mPrimary     = "#b3c1d3"; # selected window box & settings icons
	mOnPrimary   = "#0e151d"; # selected window box text
	mSecondary   = "#1d2838"; # unselected window boxes & search border
	mOnSecondary = "#b3c1d3"; # unselected window boxes text
	mHover       = "#d05145"; # hover bar buttons & top search result box
	mOnHover     = "#ffffff"; # text when hovering
	mTertiary    = "#d05145"; # accent color
	mOnTertiary  = "#111111"; # ?
	mSurfaceVariant   = "#0e151d"; # bar button holders
	mOnSurfaceVariant = "#5d5d5d"; # ?
	mError   = "#dddddd"; # ?
	mOnError = "#111111"; # ?
	mOutline = "#1d2838"; # ?
	mShadow  = "#0e151d"; # ?
};

}
