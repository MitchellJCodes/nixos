{
  description = "Noctalia Shell";

  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
    ];

    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };
  };

  outputs = { self, nixpkgs, noctalia, ... }: {
    nixosConfigurations."nixos-btw" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit noctalia;
      };

      modules = [
        ./configuration.nix
      ];
    };
  };
}
