{ config, pkgs, ... }: {

home.username = "icarus";
home.homeDirectory = "/home/icarus";

xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;
#xdg.configFile."noctalia/settings.json".source = ./noctalia-settings.json;

home.stateVersion = "25.11";

}
