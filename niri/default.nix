{ pkgs, inputs, ... }: {

imports = [
    ./noctalia.nix
];

programs.niri.enable = true;
programs.niri.package = pkgs.niri-unstable;
programs.niri.settings = {
    spawn-at-startup = [
        { argv = [ "noctalia-shell" ]; }
    ];
};

}
