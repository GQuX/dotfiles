# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }: {

imports = [
  ./hardware-configuration.nix # Hardware scan results
];

#environment.pathsToLink = [
#  "/share/applications"
#  "/share/xdg-desktop-portal"
#];

system.stateVersion = "25.11";
networking.hostName = "thinkpad";



# Bootloader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Enable networking
networking.networkmanager.enable = true;
networking.wireless.enable = true; # Enables wireless support vis wpa_supplicant.
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

# Enable the X11 windowing system.
# services.xserver.enable = true;
# services.xserver.xkb = {
#   layout = "us";
#   variant = "";
# };

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

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.icarus = {
  isNormalUser = true;
  description = "icarus";
  extraGroups = [ "networkmanager" "wheel" ];
  packages = with pkgs; [
    kdePackages.kate
  ];
};



nixpkgs.config.allowUnfree = true;
programs.firefox.enable = true;
programs.niri.enable = true;

environment.systemPackages = with pkgs; [
  vim
  wget
  git
  nano
  kitty
  fish
  kdePackages.kate
  kdePackages.konsole
  kdePackages.dolphin

  foot
  alacritty
];

}
