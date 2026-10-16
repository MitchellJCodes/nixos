
### Preview

🎉 Now automatically installs my dotfiles! 🎉

<img width="2560" height="1600" alt="Desktop preview" src="https://github.com/user-attachments/assets/d83d3ef3-6a3a-4ec3-b5b7-c3d552aecc34" />

My personal NixOS configuration, designed to work alongside my dotfiles. It targets the **NixOS Unstable** branch and includes support for **Noctalia V5**. The configuration provides a complete desktop setup, including system configuration, networking, gaming, email, and a variety of other desktop applications.

## Installation

1. Clone this repository:

```sh
git clone https://github.com/mitchelljcodes/nixos 
```

2. Edit `flake.nix` and replace `USERNAME` with your username.

3. Copy the new configuration to `/etc/nixos`

4. Rebuild the system:

```sh
sudo nixos-rebuild switch --flake /etc/nixos#nixos-btw
```
   
On the first rebuild, this configuration will automatically clone and install my dotfiles. If you ever want to force a reinstall or update, run:
```sh
nix-update --dotfiles
```

Enjoy!
