{ config, pkgs, ... }:
{
  imports = [
    device.nix
    programs.nix
    system.nix
  ];
}
