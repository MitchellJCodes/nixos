{
  description = "My Nixos Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";

    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    luciole.url = "github:noctalia-dev/luciole/cachix";

    dotfiles = {
      url = "github:mitchelljcodes/dotfiles";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      dotfiles,
      millennium,
      ...
    }:
    let
      hostname = "nixos-desktop";
      username = "mitch";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit
            inputs
            dotfiles
            hostname
            username
            nixpkgs-stable
            ;
        };

        modules = [
          {
            nixpkgs.overlays = [
              millennium.overlays.default
            ];
          }
          ./stable-packages.nix
          ./configuration.nix
        ];
      };
    };
}
