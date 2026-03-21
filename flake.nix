{

inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  niri.url = "github:sodiboo/niri-flake";

  noctalia = {
    url = "github:noctalia-dev/noctalia-shell";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.noctalia-qs.follows = "noctalia-qs"; };
  noctalia-qs = {
    url = "github:noctalia-dev/noctalia-qs";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};

outputs = inputs @ { self, nixpkgs, niri, ... }:
let
  system = "x86_64-linux";
in {
  nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ./configuration.nix
      ./noctalia.nix
      niri.nixosModules.niri
      ./niri.nix
      ];
  };
};

}
