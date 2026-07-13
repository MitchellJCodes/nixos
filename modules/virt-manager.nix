{ config, pkgs, username, ... }:

{
  # Virtualizaton
  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;

      # TPM support (Windows 11, etc.)
      swtpm.enable = true;

      # Enable secure boot firmware
      runAsRoot = false;
    };
  };

  # Virt-manager GUI
  programs.virt-manager.enable = true;

  # SPICE USB redirection
  virtualisation.spiceUSBRedirection.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer

    qemu
    qemu_kvm

    swtpm

    spice
    spice-gtk
    spice-protocol

    dnsmasq
    bridge-utils

    libguestfs
    guestfs-tools

    virtiofsd
  ];

  # User Permissions
  users.users.${username}.extraGroups = [
    "libvirtd"
    "kvm"
  ];
  
  # Optional Features

  # Better USB support
  services.udev.packages = [
    pkgs.libvirt
  ];

  # Useful if you want graphical guests
  services.spice-vdagentd.enable = true;
}
