{ config, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      systemd-boot.enable = true;
    };
  };
}
