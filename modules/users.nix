{ pkgs, ... }:

{
  users.users.<USER> = {
    isNormalUser = true;
    description = "<USER>";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = [ ];

    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}
