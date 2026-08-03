#!/usr/bin/env bash
set -euo pipefail

read -rp "Username: " USERNAME
read -rp "Hostname: " HOSTNAME

sudo rm -rf /etc/nixos
sudo git clone https://github.com/MitchellJCodes/nixos /etc/nixos

sudo sed -i "s/USERNAME/$USERNAME/g" /etc/nixos/flake.nix
sudo sed -i "s/HOSTNAME/$HOSTNAME/g" /etc/nixos/flake.nix

if [ ! -f /etc/nixos/hardware-configuration.nix ]; then
    sudo nixos-generate-config --root /
fi

sudo nixos-rebuild switch --flake /etc/nixos#$HOSTNAME
