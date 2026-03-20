{ pkgs, inputs, ... }: {

environment.systemPackages = with pkgs; [
  inputs.noctalia.packages.${pkgs.stfdenv.hostPlatform.system}.default
];

}
