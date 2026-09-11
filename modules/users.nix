{ pkgs, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    description = username;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  environment.systemPackages = [
    pkgs.nushell
    pkgs.fish
  ];

  programs.bash.interactiveShellInit = ''
    exec ${pkgs.nushell}/bin/nu
  '';
}
