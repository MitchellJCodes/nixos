{ pkgs, username, ... }:

{
  users.users.${username}= {
    isNormalUser = true;
    description = username;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = [ ];

    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}
