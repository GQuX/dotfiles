{

inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  home-manager.url = "github:nix-community/home-manager";
  home-manager.inputs.nixpkgs.follows = "nixpkgs";

  niri-flake.url = "github:sodiboo/niri-flake";
  noctalia.url = "github:noctalia-dev/noctalia-shell";
  noctalia.inputs.nixpkgs.follows = "nixpkgs";
  noctalia.inputs.noctalia-qs.follows = "noctalia-qs";
  noctalia-qs.url = "github:noctalia-dev/noctalia-qs";
  noctalia-qs.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = inputs @ { self, nixpkgs, home-manager, niri, ... }:
let
  system = "x86_64-linux";
in {
  nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ./configuration.nix
      niri-flake.nixosModules.niri
      ./noctalia.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.icarus = import ./home.nix;
      }
    ];
  };
};

}
