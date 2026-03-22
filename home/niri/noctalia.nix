{ pkgs, inputs, ... }: {

imports = [ inputs.noctalia.homeModules.default ];

programs.noctalia-shell.enable = true;
programs.noctalia-shell.settings = {
    colorSchemes = { predefinedScheme = "Monochrome"; };
};

}
