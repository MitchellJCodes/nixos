{ pkgs, username, ... }:

with pkgs; {
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
    fish
  ];

  environment.etc."nushell/config.nu".text = ''
    let fish_completer = {|spans|
      fish --command $"complete '--do-complete=($spans | str join ' ')'"
      | from tsv --flexible --noheaders --no-infer
      | rename value description
    }

    $env.config.completions.external.completer = $fish_completer
  '';
}
