{ pkgs, inputs, ... }: {

imports = [
    inputs.niri.homeModules.niri
    ./noctalia.nix
    ./keybinds.nix
];

programs.niri.enable = true;
#programs.niri.package = with pkgs; niri-unstable;

programs.niri.settings = {
    spawn-at-startup = [
        { argv = [ "noctalia-shell" ]; }
    ];
};

}
