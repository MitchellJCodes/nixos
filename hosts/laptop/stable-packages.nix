{ pkgs, nixpkgs-stable, ... }:

{
  _module.args.pkgs-stable = import nixpkgs-stable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
}
