My personal NixOS configuration, designed to work alongside my dotfiles. It targets the **NixOS Unstable** branch and includes support for **Noctalia V5**. The configuration provides a complete desktop setup, including system configuration, networking, gaming, email, and a variety of other desktop applications.

### Preview

Using my dotfiles:

<img width="2560" height="1440" alt="Desktop preview" src="https://github.com/user-attachments/assets/3c198471-18dc-4b1b-8ab8-f340b32e5f8a" />

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

Enjoy!
