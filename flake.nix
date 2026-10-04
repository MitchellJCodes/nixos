{
  description = "My Nixos Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umbriel = {
      url = "git+https://github.com/noctalia-dev/umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    app-manager = {
      url = "github:kem-a/AppManager";
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
    umbriel,
    app-manager,
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
          app-manager
          dotfiles
          hostname
          username;
      };

  modules = [
    {
      nixpkgs.overlays = [
        millennium.overlays.default
      ];
    }

    umbriel.nixosModules.default

    ./configuration.nix
  ];
    };
  };
}
