{ pkgs, inputs, avatar, ... }: {

imports = [ inputs.noctalia.homeModules.default ];

programs.noctalia-shell.enable = true;

# Settings
programs.noctalia-shell.settings = {
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
	};
};

# Color Palette
programs.noctalia-shell.colors = { # make this a json path later
	mError = "#dddddd";
	mOnError = "#111111";
	mOnPrimary = "#111111";
	mOnSecondary = "#111111";
	mOnSurface = "#828282";
	mOnSurfaceVariant = "#5d5d5d";
	mOnTertiary = "#111111";
	mOnHover = "#ffffff";
	mOutline = "#3c3c3c";
	mPrimary = "#aaaaaa";
	mSecondary = "#a7a7a7";
	mShadow = "#000000";
	mSurface = "#111111";
	mHover = "#1f1f1f";
	mSurfaceVariant = "#191919";
	mTertiary = "#cccccc";
};

}
