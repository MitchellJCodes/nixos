{ pkgs, username, ... }:

{
  users.users.${username}= {
    isNormalUser = true;
    description = username;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    shell = pkgs.nushell;
  };

  environment.systemPackages = [
    pkgs.nushell
    pkgs.fish
  ];

  programs.nushell.enable = true;
}
