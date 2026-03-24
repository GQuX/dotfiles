{ pkgs, inputs, username, avatar, wallpaper, ... }: {

imports = [
    inputs.niri.homeModules.niri
    ./noctalia.nix
    ./keybinds.nix
];

programs.niri.enable = true;
programs.niri.settings = {
    spawn-at-startup = [
        { argv = [ "noctalia-shell" ]; }
        { argv = [ "sh" "-c" "sleep 10 && kitty fastfetch" ]; }
    ];
};

home.file.".cache/noctalia/wallpapers.json".text = builtins.toJSON {
    defaultWallpaper = "${wallpaper}";
    wallpapers = {
        "DP-1" = "${wallpaper}";
    };
};

}
