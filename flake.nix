{
  description = "Nixos config flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.follows = "nixos-cosmic/nixpkgs-stable";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-cosmic,
    ...
  } @ inputs: {
    nixosConfigurations = {
      "mini" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          {
            nix.settings = {
              substituters = [
                "https://cosmic.cachix.org/"
              ];
              trusted-public-keys = [
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
              ];
            };
          }
          nixos-cosmic.nixosModules.default
          ./machines/desktop/desktop.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
