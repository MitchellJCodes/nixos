{ pkgs, username, ... }:

with pkgs;
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    shell = nushell;
  };

  environment.shells = [
    nushell
  ];

  environment.systemPackages = [
    nushell
  ];
}
