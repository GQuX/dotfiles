{

inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  niri.url = "github:sodiboo/niri-flake";
};

outputs = { self, nixpkgs, niri, ... }:
let
  system = "x86_64-linux";
in {
  nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ./configuration.nix
      niri.nixosModules.niri
    ];
  };
};

}
