{
  description = "My Nixos Configuration";

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
    nixpkgs-xwayland.url = "github:NixOS/nixpkgs/c4e0120b295daaac44f245f1c50ec06e844fe53b";

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "github:mitchelljcodes/dotfiles";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-xwayland,
    noctalia,
    noctalia-greeter,
    lanzaboote,
    dotfiles,
    millennium,
    ...
  }:
  let
    hostname = "nixos-btw";
    username = "USERNAME";
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit
          noctalia
          dotfiles
          hostname
          username;
      };

  modules = [
    {
      nixpkgs.overlays = [
        millennium.overlays.default

          (final: prev: {
            xwayland-satellite =
              (import nixpkgs-xwayland {
                system = prev.system;
              }).xwayland-satellite;
          })
      ];
    }

    lanzaboote.nixosModules.lanzaboote
    noctalia-greeter.nixosModules.default
  
    ./configuration.nix
  ];
    };
  };
}
