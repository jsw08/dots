{ config, pkgs, ... }:
{
  services.power-profiles-daemon.enable = true;
  services.udisks2.enable = true;
}
