{ pkgs, username, dotfiles, ... }:

{
  system.activationScripts.bootstrapDotfiles.text = ''
    ${pkgs.bash}/bin/bash ${./bootstrap-dotfiles.sh} \
      "/home/${username}" \
      "${username}" \
      "${dotfiles}"
  '';
}
