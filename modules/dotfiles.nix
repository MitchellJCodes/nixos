{ pkgs, username, dotfiles, ... }:

{
  system.activationScripts.bootstrapDotfiles.text = ''
    ${pkgs.bash}/bin/bash ${./scripts/bootstrap-dotfiles.sh} \
      "/home/${username}" \
      "${username}" \
      "${dotfiles}"
  '';
}
