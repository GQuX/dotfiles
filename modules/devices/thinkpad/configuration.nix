{ self, inputs, ... }: { flake.nixosModules.thinkpadConfiguration = { pkgs, lib, ... }: {

imports = [
	self.nixosModules.thinkpadHardware
	self.nixosModules.niri
];

system.stateVersion = "25.11";
networking.hostName = "thinkpad";

nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Bootloader
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

# Enable networking
networking.networkmanager.enable = true;
nix.settings.download-buffer-size = 524288000;

hardware.bluetooth.enable = true;
services.upower.enable = true;
services.power-profiles-daemon.enable = true;

# Localization
time.timeZone = "America/Chicago";
i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = {
	LC_ADDRESS = "en_US.UTF-8";
	LC_IDENTIFICATION = "en_US.UTF-8";
	LC_MEASUREMENT = "en_US.UTF-8";
	LC_MONETARY = "en_US.UTF-8";
	LC_NAME = "en_US.UTF-8";
	LC_NUMERIC = "en_US.UTF-8";
	LC_PAPER = "en_US.UTF-8";
	LC_TELEPHONE = "en_US.UTF-8";
	LC_TIME = "en_US.UTF-8";
};

services.displayManager.sddm.enable = true;
services.displayManager.sddm.wayland.enable = true;

# Enable CUPS to print documents.
services.printing.enable = true;

# Enable sound with pipewire.
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
};

users.users.icarus = {
	description = "icarus";
	isNormalUser = true;
	extraGroups = [ "wheel" "networkmanager" ];
	shell = pkgs.fish;
};

nixpkgs.config.allowUnfree = true;
programs.fish.enable = true;

environment.systemPackages = with pkgs; [
	wget
	git
	fish  # Shell
	kitty # Console
	kdePackages.kate    # Text Editor
	kdePackages.dolphin # File Browser
	fastfetch # System stats

	grim   # grabs screen
	slurp  # region select (calls grim)
	swappy # screenshot editor (calls slurp)
	wl-clipboard # copy images & terminal

	ani-cli # anime fetcher
	mpv     # video software (ani-cli)

	brave # browser
	spotify # music player
	vesktop # electron based discord (better maintained)
];

}; }
