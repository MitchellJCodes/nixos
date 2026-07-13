My NixOS configuration is made to work with my dotfiles. It uses the NixOS Unstable brach, and supports noctalia V5, as does my dotfiles. The configuration supports system configuration, networking, gaming, email and other usefull desktop software.


Preview using my dotfiles:
<img width="2560" height="1440" alt="Pasted image" src="https://github.com/user-attachments/assets/3c198471-18dc-4b1b-8ab8-f340b32e5f8a" />


To install my configuration, clone the repository and change the luks boot device in modules/boot.nix, to the installed device, and change the username in flake.nix, which has the place holder <USER>. Finally, run sudo Nixos-rebuild switch --flake /etc/nixos#nixos-btw and enjoy!
